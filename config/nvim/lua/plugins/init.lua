--
-- Check if lazy is installed, if not cloned it from github
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--
-- Plugin list
--
return require('lazy').setup({
  --
  -- Navigation
  --

  -- Easy navigation between lines with 's' and motions
  {
    "ggandor/leap.nvim",
    config = function() require("leap").add_default_mappings() end
  },


  -- Motions between parenthesis, brackets, etc...
  {
    "tpope/vim-surround",
    config = function() vim.cmd([[ xmap gs <Plug>VSurround ]]) end
  },

  -- '.' command for repeating macros with plugins
  { "tpope/vim-repeat" },

  -- Navigation between tmux and nvim
  {
    "numToStr/Navigator.nvim",
    config = { auto_save = 'current' }
  },

  --
  -- GUI Plugins
  --

  -- Theme
  {
    "norcalli/nvim-base16.lua",
    dependencies = "norcalli/nvim.lua"
  },

  -- Add nice icons for patch fonts
  {
    "kyazdani42/nvim-web-devicons",
    lazy = true,
    config = function() require "plugins.configs.devicons" end
  },

  -- Buffer list on top of the screen
  {
    "akinsho/nvim-bufferline.lua",
    config = function() require "plugins.configs.bufferline" end
  },

  -- Indentation guides/tracking
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function() require "plugins.configs.blankline" end
  },

  -- Smooth scrolling
  {
    "karb94/neoscroll.nvim",
    config = function() require "plugins.configs.neoscroll" end
  },

  -- Color highlighter for hex, rgb, etc...
  {
    "NvChad/nvim-colorizer.lua",
    config = {
      user_default_options = {
        names = false,
        mode = "virtualtext",
        virtualtext = "■"
      }
    }
  },

  --
  -- Find files
  --

  -- Tree view of the current directory
  {
    "kyazdani42/nvim-tree.lua",
    lazy = true,
    keys = {
      { "<leader>t", "<cmd>NvimTreeToggle<cr>", desc = "[t]ree view" }
    },
    config = function() require "plugins.configs.nvim-tree" end
  },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        cond = vim.fn.executable 'make' == 1,
        build = 'make'
      }
    },
    config = function() require "plugins.configs.telescope" end
  },

  --
  -- Git
  --
  {
    "tpope/vim-fugitive",
    lazy = true,
    keys = {
      { "<leader>g", "<cmd>vert Git<cr>", desc = "[g]it view" }
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function() require "plugins.configs.gitsigns" end
  },

  --
  -- LSP (Language Server Protocol)
  --
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim"
    },
    config = function() require "plugins.configs.lspconfig" end
  },

  -- Autocompletion/Snippets
  {
    "L3MON4D3/LuaSnip", -- snippets
    event = 'InsertEnter',
    dependencies = { "rafamadriz/friendly-snippets" },
  },
  {
    "hrsh7th/nvim-cmp",
    event = 'InsertEnter',
    dependencies = {
      "onsails/lspkind-nvim", -- icons in completion menu
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip"
    },
    config = function() require "plugins.configs.completion" end
  },

  -- Latex integration
  {
    "lervag/vimtex",
    ft = "tex",
    setup = function()
      vim.g.tex_flavor = 'latex'
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_quickfix_mode = 0
    end
  },
  {
    "iurimateus/luasnip-latex-snippets.nvim",
    ft = "tex",
    dependencies = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
    config = function()
      require 'luasnip-latex-snippets'.setup()
    end
  },

  --
  -- Treesitter (syntax highlight, autopairs and comment strings)
  --
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    config = function() require "plugins.configs.treesitter" end,
    dependencies = {
      "windwp/nvim-ts-autotag",
      "nvim-treesitter/playground",
      "JoosepAlviste/nvim-ts-context-commentstring",
      {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function() require "plugins.configs.autopairs" end
      },
      {
        "terrortylor/nvim-comment", -- Comment lines more easily and motions
        config = function() require "plugins.configs.comment" end
      },
    }
  },

})
