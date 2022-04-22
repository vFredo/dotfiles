--
-- Install servers
--
if not packer_plugins["nvim-lsp-installer"].loaded then
  require "packer".loader("nvim-lsp-installer")
end

local lsp_installer = require("nvim-lsp-installer")
local lsp_installer_servers = require('nvim-lsp-installer.servers')

-- GUI of lsp-installer
lsp_installer.settings {
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local buf_map = require("core.utils").buf_map
  local function buf_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = { noremap = true, silent = true }
  buf_map(bufnr, 'n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', opts)
  buf_map(bufnr, "n", "gr", "<cmd>Lspsaga rename<cr>", opts)
  buf_map(bufnr, "n", "ga", "<cmd>Lspsaga code_action<cr>", opts)
  buf_map(bufnr, "n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
  buf_map(bufnr, "n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
  buf_map(bufnr, "n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)

  -- if the server client can format files then format on save
  if client.resolved_capabilities.document_formatting then
    -- vim.cmd([[ autocmd! BufWritePre <buffer> lua vim.lsp.buf.formatting() ]])
    vim.cmd([[
      command! Format lua vim.lsp.buf.formatting()
    ]])
  end
end

-- Servers to install with nvim-lsp-installer
local servers = {
  'clangd',
  'gopls',
  'pyright',
  'html',
  'cssls',
  'tsserver',
  'tailwindcss',
  'sumneko_lua'
}

-- server's setup via lsp_installer intalled if it don't exist, else make the setup
for _, server_name in pairs(servers) do
  local server_available, server = lsp_installer_servers.get_server(server_name)
  if server_available then
    server:on_ready(function()
      local cmp_capabilities = require("cmp_nvim_lsp").update_capabilities
      -- When this particular server is ready (i.e. when installation is finished or the server is already installed),
      -- this function will be invoked. Make sure not to use the "catch-all" lsp_installer.on_server_ready()
      -- function to set up servers, to avoid doing setting up a server twice.
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
      server:setup(opts) -- Setup the server
    end)
    if not server:is_installed() then
      server:install() -- Queue the server to be installed if is not already install.
    end
  end
end

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
    -- virtual_text = { prefix = "", spacing = 2 },
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
