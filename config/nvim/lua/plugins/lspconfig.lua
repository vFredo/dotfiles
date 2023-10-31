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

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "williamboman/mason.nvim", build = ":MasonUpdate",
        opts = { ui = { border = 'rounded' } }
      },
      {
        "williamboman/mason-lspconfig.nvim",
        opts = { ensure_installed = vim.tbl_keys(servers), automatic_installation = true }
      }
    },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      -- nvim-cmp supports additional completion capabilities
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      mason_lspconfig.setup_handlers({
        function(server_name)
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            settings = servers[server_name],
          }
        end,
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
    end
  }
}
