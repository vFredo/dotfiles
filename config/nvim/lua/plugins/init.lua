--
-- Making sure that packer is install
--
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_bootstrap = nil

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require("packer").startup(function(use)
  -- Update packer manager
  use { "wbthomason/packer.nvim" }

  --
  -- Miscellaneous
  --

  -- Comment lines more easily
  use { "tpope/vim-commentary" }

  -- Operation between parenthesis, brackets, etc...
  use { "tpope/vim-surround" }

  -- tmux/nvim navigation
  use { "christoomey/vim-tmux-navigator" }

  -- :bdelete, :close, :quit in one command
  use { "mhinz/vim-sayonara" }

  -- Speed up lua modules on startup
  use { 'lewis6991/impatient.nvim' }

  --
  -- GUI Plugins
  --

  -- Icons for telescope, bufferline, feline (statusline) and NvimTree
  use {
    "kyazdani42/nvim-web-devicons",
    config = [[ require "plugins.configs.devicons" ]]
  }

  -- Bufferline
  use {
    "akinsho/nvim-bufferline.lua",
    after = "nvim-web-devicons",
    config = [[ require "plugins.configs.bufferline" ]]
  }

  -- Indentation guides/tracking
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = [[ require "plugins.configs.blankline" ]]
  }

  -- Statusline
  use {
    'famiu/feline.nvim',
    branch = 'master',
    after = "nvim-web-devicons",
    config = [[ require "plugins.configs.statusline" ]]
  }

  -- Tree view of the project
  use {
    "kyazdani42/nvim-tree.lua",
    after = "nvim-web-devicons",
    config = [[ require "plugins.configs.nvim-tree" ]]
  }

  -- Theme
  use {
    "norcalli/nvim-base16.lua",
    requires = { "norcalli/nvim.lua" }
  }

  -- Smooth scrolling
  use {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup()
    end
  }

  -- Fuzzy finder
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
    config = [[ require "plugins.configs.telescope" ]]
  }

  --
  -- Git
  --
  use {
    "lewis6991/gitsigns.nvim",
    requires = { "tpope/vim-fugitive" },
    config = [[ require "plugins.configs.gitsigns" ]]
  }

  --
  -- LSP
  --
  use {
    "neovim/nvim-lspconfig",
    requires = {
      "williamboman/nvim-lsp-installer",
      "ray-x/lsp_signature.nvim"
    },
    config = [[ require "plugins.configs.lspconfig" ]]
  }

  -- Autocomplete
  use {
    'ms-jpq/coq_nvim',
    branch = 'coq',
    requires = {
      { 'ms-jpq/coq.artifacts', branch = 'artifacts' },
      { 'ms-jpq/coq.thirdparty', branch = '3p'}
    },
    setup = function()
      vim.g.coq_settings = {
        auto_start = 'shut-up',
        ["keymap.recommended"] = false,
        ["keymap.jump_to_mark"] = "<c-b>",
        ["keymap.manual_complete"] = "<c-n>",
        clients = { tabnine = { enabled = true } }
      }
    end,
    config = [[ require "plugins.configs.coq" ]]
  }

  --
  -- Web development Javascript/React/Typescript
  --
  use {
    "nvim-treesitter/nvim-treesitter",
    requires = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "windwp/nvim-ts-autotag",
      "windwp/nvim-autopairs"
    },
    branch = "0.5-compat",
    run = ":TSUpdate",
    config = [[ require "plugins.configs.treesitter" ]]
  }

  -- Color highlighter for hex, rgb, etc...
  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({"*"}, {
        names = false,   -- "Name" codes like 'Blue'
        RRGGBB = true,   -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true,   -- CSS rgb() and rgba() functions
      })
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  if packer_bootstrap ~= nil then
    require('packer').sync()
  end
end)
