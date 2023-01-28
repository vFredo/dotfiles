--
-- Check if packer is installed, if not cloned it from github
--
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      'git', 'clone',
      '--depth', '1',
      'https://github.com/wbthomason/packer.nvim',
      install_path
    })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

-- Use a protected call so we don't error out on first use
local packer_boostrap = ensure_packer()
local _, packer = pcall(require, "packer")

-- Packer setup
packer.init {
  display = {
    working_sym = "ﲊ",
    error_sym = "✗ ",
    done_sym = " ",
    removed_sym = " ",
    moved_sym = "",
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
-- Plugin list
--
return packer.startup(function(use)
  -- Update plugin manager
  use { "wbthomason/packer.nvim" }

  -- Speed up startup time
  use { "lewis6991/impatient.nvim" }

  --
  -- Navigation
  --

  -- Easy navigation between lines
  use {
    "phaazon/hop.nvim",
    branch = 'v2',
    config = function() require("hop").setup() end
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
    config = function() require("plugins.configs.others").blankline() end
  }

  -- Smooth scrolling
  use {
    "karb94/neoscroll.nvim",
    config = function() require("plugins.configs.others").neoscroll() end
  }

  -- Color highlighter for hex, rgb, etc...
  use {
    "NvChad/nvim-colorizer.lua",
    config = function ()
      require("colorizer").setup {
        user_default_options = {
          names = false,
          mode = "virtualtext",
          virtualtext = "■"
        }
      }
    end
  }

  --
  -- Find files
  --

  -- Tree view of the current directory
  use {
    "kyazdani42/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    requires = "nvim-web-devicons",
    config = function() require "plugins.configs.nvim-tree" end
  }

  -- Fuzzy finder
  use {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
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
    event = "BufReadPre",
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      { "williamboman/mason.nvim", config = function() require("mason").setup() end },
      { "williamboman/mason-lspconfig.nvim" }
    },
    config = function() require "plugins.configs.lspconfig" end,
  }

  use {
    "glepnir/lspsaga.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function() require "plugins.configs.saga-lsp" end
  }

  -- Autocompletion/Snippets
  use {
    {
      "L3MON4D3/LuaSnip", -- snippets
      requires = { "rafamadriz/friendly-snippets", event = "InsertEnter" },
    },
    {
      "hrsh7th/nvim-cmp",
      module = "cmp",
      event = { "InsertEnter", "CmdLineEnter" },
      requires = {
        { "onsails/lspkind-nvim" }, -- icons in completion menu
        { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
        { "hrsh7th/cmp-path", after = "nvim-cmp" },
        { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
        { "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
        { "saadparwaiz1/cmp_luasnip", after = { "LuaSnip", "nvim-cmp" } },
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
    { 'nvim-treesitter/playground', after = "nvim-treesitter" },
    { "windwp/nvim-ts-autotag", after = "nvim-treesitter" },
    { "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" }
  }

  -- When we are bootstrapping a configuration, it doesn't
  -- make sense to execute the rest of the init.lua.
  --
  -- You'll need to restart nvim, and then it will work.
  if packer_boostrap then
    print '=================================='
    print '    Plugins are being installed'
    print '    Wait until Packer completes,'
    print '       then restart nvim'
    print '=================================='
    require("packer").sync()
  end
end)

