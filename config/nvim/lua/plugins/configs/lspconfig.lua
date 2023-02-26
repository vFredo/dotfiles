--
-- Install servers
--
local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok then
  vim.notify("Couldn't load mason " .. mason_lspconfig .. "\n")
end

-- Servers configurations and ensured they are installed
local servers = {
  clangd = {},
  pyright = {},
  html = {},
  cssls = {},
  tsserver = {},
  tailwindcss = {},
  gopls = {
    gopls = {
      experimentalPostfixCompletions = true,
      staticcheck = true,
      analyses = { unusedparams = true, shadow = true, }
    },
  },
  lua_ls = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim", "packer_plugins" } },
      telemetry = { enable = false },
      workspace = {
        checkThirdParty = false,
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
        }
      },
    }
  }
}

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
  automatic_installation = true
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local buf_map = require("core.utils").map
  local function buf_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = { noremap = true, buffer = bufnr, silent = true }
  buf_map('n', 'gd', "<cmd>Telescope lsp_definitions<cr>", opts)
  buf_map('n', 'gr', "<cmd>Telescope lsp_references<cr>", opts)
  buf_map('n', 'gi', "<cmd>Telescope lsp_implementations<cr>", opts)
  buf_map("n", "ga", vim.lsp.buf.code_action, opts)
  buf_map('n', '<leader>rn', vim.lsp.buf.rename, opts)
  buf_map("n", "K", vim.lsp.buf.hover, opts)
  buf_map("n", "[d", vim.diagnostic.goto_prev, opts)
  buf_map("n", "]d", vim.diagnostic.goto_next, opts)

  -- if the server client can format files then create the command 'Format'
  if client.server_capabilities.documentFormattingProvider then
    vim.cmd([[ command! Format lua vim.lsp.buf.format { async = true } ]])
  end
end

-- nvim-cmp supports additional completion capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()

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
local signs = {
  Error = ' ',
  Info = ' ',
  Warn = ' ',
  Hint = '',
}

for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  -- virtual_text = { prefix = "", spacing = 2 },
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = { border = "rounded" }
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, { border = "rounded", title = "hover" }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.hover, { border = "rounded", title = "hover" }
)
