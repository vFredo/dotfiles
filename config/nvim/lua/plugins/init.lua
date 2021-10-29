--
-- Check if packer is installed
--
local ok, packer = pcall(require, "plugins.packerInit")

if not ok then
  return false
end

return packer.startup(function(use)
  -- Update packer manager
  use { "wbthomason/packer.nvim" }

  --
  -- Miscellaneous
  --

  -- :bdelete, :close and :quit in one smart command
  use { "mhinz/vim-sayonara" }

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
    config = function() require "plugins.configs.others".surround() end
  }

  -- Navigation between tmux and nvim
  use {
    "numToStr/Navigator.nvim",
    config = function() require "plugins.configs.others".navigator() end
  }

  -- Color highlighter for hex, rgb, etc...
  use {
    "rrethy/vim-hexokinase",
    run = "make hexokinase",
    config = function() require "plugins.configs.others".hexokinase() end
  }

  --
  -- GUI Plugins
  --

  -- Theme
  use {
    "norcalli/nvim-base16.lua",
    requires = { "norcalli/nvim.lua" }
  }

  -- Icons for telescope, bufferline, feline (statusline) and NvimTree
  use {
    "kyazdani42/nvim-web-devicons",
    module = "nvim-web-devicons",
    config = function() require "plugins.configs.devicons" end
  }

  -- Bufferline
  use {
    "akinsho/nvim-bufferline.lua",
    opt = true,
    event = "UIEnter",
    requires = "nvim-web-devicons",
    config = function() require "plugins.configs.bufferline" end
  }

  -- Statusline
  use {
    "famiu/feline.nvim",
    branch = "master",
    requires = "nvim-web-devicons",
    config = function() require "plugins.configs.statusline" end
  }

  -- Tree view of the project
  use {
    "kyazdani42/nvim-tree.lua",
    event = "UIEnter",
    requires = "nvim-web-devicons",
    setup = function() require "plugins.configs.nvim-tree".tree_setup() end,
    config = function() require "plugins.configs.nvim-tree".tree_config() end
  }

  -- Fuzzy finder
  use {
    "nvim-telescope/telescope.nvim",
    opt = true,
    module = "telescope",
    cmd = "Telescope",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
      "nvim-web-devicons",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }, -- fzf integration
    },
    setup = function() require "plugins.configs.telescope".setup() end,
    config = function() require "plugins.configs.telescope".config() end
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

  --
  -- Git
  --
  use {
    {
      "lewis6991/gitsigns.nvim",
      opt = true,
      event = { 'BufRead','BufNewFile' },
      requires = { "nvim-lua/plenary.nvim" },
      config = function() require "plugins.configs.gitsigns" end
    },
    {
      "TimUntersberger/neogit",
      opt = true,
      cmd = "Neogit",
      requires = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
      config = function() require "plugins.configs.others".neogit() end
    }
  }

  --
  -- LSP
  --
  use {
    "neovim/nvim-lspconfig",
    opt = true,
    event = 'BufReadPre',
    requires = "williamboman/nvim-lsp-installer",
    config = function() require "plugins.configs.lspconfig" end,
  }

  -- Autocomplete/Snippets
  use {
    { "L3MON4D3/LuaSnip", requires = { "rafamadriz/friendly-snippets" } }, -- Snippets
    {
      "hrsh7th/nvim-cmp",
      module = "cmp",
      after = "LuaSnip",
      event = "InsertEnter",
      requires = {
        { "onsails/lspkind-nvim" }, -- icons in complete menu
        { "tzachar/cmp-tabnine", run = "./install.sh" }, -- tabnine source
        { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp", opt = true },
        { "hrsh7th/cmp-path", after = "nvim-cmp", opt = true },
        { "hrsh7th/cmp-buffer", after = "nvim-cmp", opt = true },
        { "saadparwaiz1/cmp_luasnip", after = { "LuaSnip", "nvim-cmp" }, opt = true },
      },
      config = function() require "plugins.configs.cmp" end
    }
  }

  --
  -- TreeSitter
  --
  use {
    {
      "nvim-treesitter/nvim-treesitter",
      branch = "0.5-compat",
      run = ":TSUpdate",
      config = function() require "plugins.configs.treesitter" end
    },
    {
      "windwp/nvim-autopairs",
      after =  "nvim-treesitter",
      config = function() require "plugins.configs.autopairs" end
    },
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      branch = "0.5-compat",
      after = "nvim-treesitter"
    },
    { "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" },
    { "windwp/nvim-ts-autotag", after = "nvim-treesitter" }
  }
end)
