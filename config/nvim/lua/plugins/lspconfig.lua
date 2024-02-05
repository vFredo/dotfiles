-- Servers configurations and ensured they are installed
local servers = {
  jdtls = {
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
  },
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
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate",
      opts = { ui = { border = 'rounded' } }
    },
    {
      "williamboman/mason-lspconfig.nvim",
      opts = { ensure_installed = vim.tbl_keys(servers), automatic_installation = true }
    }
  },
  config = function()
    -- nvim-cmp supports additional completion capabilities
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    require("mason-lspconfig").setup_handlers({
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          settings = servers[server_name],
        }
      end,
    })

    -- Lsp buffer keymaps and options for buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(event)
        -- Enable completion default trigger by <c-x><c-o>
        vim.bo[event.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Delete highlight semantic tokens since treesitter takes care of it
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        client.server_capabilities.semanticTokensProvider = nil

        -- Mappings
        local opts = { noremap = true, buffer = event.buf, silent = true }
        local desc = require("core.utils").desc

        vim.keymap.set('i', '<M-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gd', "<cmd>Telescope lsp_definitions<cr>", desc(opts, "[g]o [d]efinitions"))
        vim.keymap.set('n', 'gr', "<cmd>Telescope lsp_references<cr>", desc(opts, "[g]o [r]eferences"))
        vim.keymap.set('n', 'gi', "<cmd>Telescope lsp_implementations<cr>", desc(opts, "[g]o [i]mplementations"))
        vim.keymap.set("n", "ga", vim.lsp.buf.code_action, desc(opts, "[g]o [a]ction in code"))
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, desc(opts, "Previous [d]iagnostic"))
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, desc(opts, "Next [d]iagnostic"))
        vim.keymap.set('n', '<Leader>fd', "<cmd>Telescope diagnostics<cr>", desc(opts, "[f]ind [d]iagnostic"))
        vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, desc(opts, "[r]e[n]ame in current position"))
        vim.keymap.set('n', '<Leader>F', function() vim.lsp.buf.format { async = true } end,
          desc(opts, "[F]ormat document"))
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
  end
}
