--
-- Install servers
--
local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok then
  vim.notify("Couldn't load mason " .. mason_lspconfig .. "\n")
end

-- Servers configurations and ensured they are installed
local servers = {
  bashls = {},
  clangd = {},
  pyright = {},
  cssls = {},
  tsserver = {},
  tailwindcss = {},
  rust_analyzer = {},
  emmet_ls = {
    filetypes = {
      'html', 'typescriptreact', 'javascriptreact',
      'css', 'sass', 'scss', 'less'
    }
  },
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
      diagnostics = { globals = { "vim" } },
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

-- nvim-cmp supports additional completion capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      settings = servers[server_name],
    }
  end,
}

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(event)
    -- Enable completion default trigger by <c-x><c-o>
    vim.bo[event.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Mappings
    local map = require("core.utils").map
    local opts = { noremap = true, buffer = event.buf, silent = true }

    map('i', '<M-k>', vim.lsp.buf.signature_help, opts)
    map('n', 'gd', "<cmd>Telescope lsp_definitions<cr>", opts)
    map('n', 'gr', "<cmd>Telescope lsp_references<cr>", opts)
    map('n', 'gi', "<cmd>Telescope lsp_implementations<cr>", opts)
    map("n", "K", vim.lsp.buf.hover, opts)
    map("n", "ga", vim.lsp.buf.code_action, opts)
    map("n", "[d", vim.diagnostic.goto_prev, opts)
    map("n", "]d", vim.diagnostic.goto_next, opts)
    map('n', '<leader>fd', "<cmd>Telescope diagnostics<cr>", opts)
    map('n', '<leader>rn', vim.lsp.buf.rename, opts)
    map('n', '<leader>F', function() vim.lsp.buf.format { async = true } end, opts)
  end
})

-- Change the default lsp diagnostic symbols
local signs = {
  Error = "",
  Info = "",
  Warn = "",
  Hint = "",
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
