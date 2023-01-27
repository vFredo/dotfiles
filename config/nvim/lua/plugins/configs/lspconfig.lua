--
-- Install servers
--
local mason_lspconfig = require("mason-lspconfig")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local buf_map = require("core.utils").buf_map
  local function buf_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = { noremap = true, silent = true }
  buf_map(bufnr, 'n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>', opts)
  buf_map(bufnr, 'n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<cr>', opts)
  buf_map(bufnr, "n", "ga", "<cmd>Lspsaga code_action<cr>", opts)
  buf_map(bufnr, "n", "<leader>rn", "<cmd>Lspsaga rename<cr>", opts)
  buf_map(bufnr, "n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
  buf_map(bufnr, "n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
  buf_map(bufnr, "n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)

  -- if the server client can format files then create command 'Format'
  if client.server_capabilities.documentFormattingProvider then
    vim.cmd([[ command! Format lua vim.lsp.buf.formatting() ]])
  end
end

-- Servers to install with mason-lspconfig
local servers = {
  clangd = {},
  gopls = {},
  pyright = {},
  html = {},
  cssls = {},
  tsserver = {},
  tailwindcss = {},
  sumneko_lua = {
    Lua = {
      -- runtime = { version = "LuaJIT", path = vim.split(package.path, ';') },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        }
      },
      diagnostics = { globals = { "vim", "packer_plugins" } },
      telemetry = { enable = false }
    }
  }
}

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
  automatic_installation = true
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

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
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = "single", }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = "single", }
)
