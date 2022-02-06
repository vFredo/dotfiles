--
-- Install servers
--
if not packer_plugins["nvim-lsp-installer"].loaded then
  require"packer".loader("nvim-lsp-installer")
end

local lsp_installer = require("nvim-lsp-installer")
local lsp_installer_servers = require('nvim-lsp-installer.servers')

lsp_installer.settings{
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
}

-- Servers to install with nvim-lsp-installer
local servers = {
  'clangd',
  'gopls',
  'html',
  'jsonls',
  'tsserver',
  'pyright',
  'cssls',
  'bashls',
  'volar',
  'tailwindcss',
  'sumneko_lua'
}

-- Install servers of the list if they aren't installed
for _, currServer in ipairs(servers) do
  local ok, server =  lsp_installer_servers.get_server(currServer)
  if ok and not server:is_installed() then
    server:install()
  end
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local buf_map = require("core.utils").buf_map
  local function buf_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = { noremap=true, silent=true }
  buf_map(bufnr, 'n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', opts)
  buf_map(bufnr, 'n', 'ga', '<cmd>lua require("telescope.builtin").lsp_code_actions()<CR>', opts)
  buf_map(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_map(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_map(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_map(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

  -- if the server client can format files then format on save
  if client.resolved_capabilities.document_formatting then
    vim.cmd([[ autocmd! BufWritePre <buffer> lua vim.lsp.buf.formatting(nil, 1000) ]])
  end
end

-- server's setup via lsp_installer
lsp_installer.on_server_ready(function(server)
  local cmp_capabilities = require("cmp_nvim_lsp").update_capabilities

  local opts = {
    on_attach = on_attach,
    capabilities = cmp_capabilities(vim.lsp.protocol.make_client_capabilities()),
    flags = { debounce_text_changes = 150 },
  }

  if server.name == "gopls" then
    opts.cmd = { 'gopls' }
    opts.settings = {
      gopls = {
        experimentalPostfixCompletions = true,
        analyses = {
          unusedparams = true,
          shadow = true,
        },
        staticcheck = true,
      },
    }
  elseif server.name == "sumneko_lua" then
    opts.settings = {
      Lua = {
        runtime = { version = "LuaJIT", path = vim.split(package.path, ';') },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
          }
        },
        diagnostics = { globals = { "vim", "packer_plugins" } },
        telemetry = { enable = false }
      },
    }
  end

  server:setup(opts)
  vim.cmd [[ do User LspAttachBuffers ]]
end)

-- Change the default lsp diagnostic symbols
local function lspSymbol(name, icon)
  local hl = "DiagnosticSign" .. name
  vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

lspSymbol("Error", " ")
lspSymbol("Info", " ")
lspSymbol("Hint", "")
lspSymbol("Warn", " ")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- virtual_text = { prefix = "", spacing = 2, },
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
  }
)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = "single", }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = "single", }
)
