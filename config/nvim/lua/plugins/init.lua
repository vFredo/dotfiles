--
-- Check if packer is installed, if not cloned it from github
--
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOSTRAP = vim.fn.system({
    'git', 'clone',
    '--depth', '20',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
end

-- Use a protected call so we don't error out on first use
local _, packer = pcall(require, "packer")

-- Packer setup
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
  },
  git = { clone_timeout = 6000 }, -- seconds
  auto_clean = true,
  compile_on_sync = true,
  profile = { enable = true }
}

--
-- Plugin startup list
--
return packer.startup(function(use)
  -- Update plugin manager
  use { "wbthomason/packer.nvim" }

  -- Speed up startup time
  use { 'lewis6991/impatient.nvim' }

  --
  -- Navigation
  --

  -- Easy navigation between lines
  use {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function() require'hop'.setup() end
  }

  -- Comment lines more easily
  use {
    "terrortylor/nvim-comment",
    after = "nvim-treesitter",
    event = "BufRead",
    config = function() require "plugins.configs.others".comment() end
  }

  -- Operation between parenthesis, brackets, etc...
  use {
    "tpope/vim-surround",
    config = function() vim.cmd([[ xmap gs <Plug>VSurround ]]) end
  }

  -- Navigation between tmux and nvim
  use {
    "numToStr/Navigator.nvim",
    config = function() require("Navigator").setup { auto_save = 'current' } end
  }

  --
  -- GUI Plugins
  --

  -- Theme
  use {
    "norcalli/nvim-base16.lua",
    requires = { "norcalli/nvim.lua" }
  }

  -- Add nice icons for patch fonts
  use {
    "kyazdani42/nvim-web-devicons",
    module = "nvim-web-devicons",
    config = function() require "plugins.configs.devicons" end
  }

  -- Buffer list on top of the screen
  use {
    "akinsho/nvim-bufferline.lua",
    opt = true,
    event = "UIEnter",
    requires = "nvim-web-devicons",
    config = function() require "plugins.configs.bufferline" end
  }

  -- Indentation guides/tracking
  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = function() require "plugins.configs.others".blankline() end
  }

  -- Smooth scrolling
  use {
    "karb94/neoscroll.nvim",
    config = function() require "plugins.configs.others".neoscroll() end
  }

  -- Color highlighter for hex, rgb, etc...
  use {
    "rrethy/vim-hexokinase", -- NOTE: This needs golang to work
    run = "make hexokinase",
    config = function() require "plugins.configs.others".hexokinase() end
  }

  --
  -- Find files
  --

  -- Tree view of the current directory
  use {
    "kyazdani42/nvim-tree.lua",
    event = "UIEnter",
    requires = "nvim-web-devicons",
    config = function() require "plugins.configs.nvim-tree" end
  }

  -- Fuzzy finder
  use {
    "nvim-telescope/telescope.nvim",
    branch = '0.1.x',
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
      "nvim-web-devicons",
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1  }
    },
    setup = function() require "plugins.configs.telescope".setup() end,
    config = function() require "plugins.configs.telescope".config() end
  }

  --
  -- Git
  --
  use {
    { "tpope/vim-fugitive" },
    {
      "lewis6991/gitsigns.nvim",
      opt = true,
      event = { "BufRead", "BufNewFile" },
      requires = { "nvim-lua/plenary.nvim" },
      config = function() require "plugins.configs.gitsigns" end
    }
  }

  --
  -- LSP (Language Server Protocol)
  --
  use {
    "neovim/nvim-lspconfig",
    requires = {
      { "williamboman/mason.nvim", config = function() require("mason").setup() end },
      "williamboman/mason-lspconfig.nvim" -- Automatically install LSPs to stdpath for neovim
    },
    config = function() require "plugins.configs.lspconfig" end,
  }

  use {
    "tami5/lspsaga.nvim",
    config = function()
      require('lspsaga').setup {
        use_saga_diagnostic_sign = false,
        code_action_prompt = { enable = false }
      }
    end
  }

  -- Autocomplete/Snippets
  use {
    {
      "L3MON4D3/LuaSnip", -- snippets
      requires = { "rafamadriz/friendly-snippets", event = "InsertEnter" },
    },
    {
      "hrsh7th/nvim-cmp",
      module = "cmp",
      event = "InsertEnter",
      requires = {
        { "onsails/lspkind-nvim" }, -- icons in completion menu
        { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp", opt = true },
        { "hrsh7th/cmp-path", after = "nvim-cmp", opt = true },
        { "hrsh7th/cmp-buffer", after = "nvim-cmp", opt = true },
        { "hrsh7th/cmp-cmdline", after = "nvim-cmp", opt = true },
        { "saadparwaiz1/cmp_luasnip", after = { "LuaSnip", "nvim-cmp" }, opt = true },
      },
      config = function() require "plugins.configs.completion" end
    }
  }

  -- Latex integration
  use {
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
      requires = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
      config = function ()
        require("luasnip.loaders.from_vscode").lazy_load()
      end
    }
  }

  --
  -- Treesitter (syntax highlight, autopairs and comment strings)
  --
  use {
    {
      "nvim-treesitter/nvim-treesitter",
      event = "UIEnter",
      run = function()
        pcall(require('nvim-treesitter.install').update { with_sync = true })
      end,
      config = function() require "plugins.configs.treesitter" end
    },
    {
      "windwp/nvim-autopairs",
      after = "nvim-treesitter",
      config = function() require "plugins.configs.autopairs" end
    },
    { "windwp/nvim-ts-autotag", after = "nvim-treesitter" },
    { "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" }
  }

  -- When we are bootstrapping a configuration, it doesn't
  -- make sense to execute the rest of the init.lua.
  --
  -- You'll need to restart nvim, and then it will work.
  if PACKER_BOOSTRAP then
    require("packer").sync()
    print '=================================='
    print '    Plugins are being installed'
    print '    Wait until Packer completes,'
    print '       then restart nvim'
    print '=================================='
  end
end)

