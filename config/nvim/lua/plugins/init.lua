--
-- Check if packer is installed
--
local ok, packer = pcall(require, "plugins.packerInit")

if not ok then
  error("Couldn't load packer " .. packer .. "\n")
end

return packer.startup(function(use)
  -- Update plugin manager
  use { "wbthomason/packer.nvim" }

  --
  -- Miscellaneous
  --

  -- COQ IDE
  use { "whonore/Coqtail" }

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

  -- Color highlighter for hex, rgb, etc...
  use {
    "rrethy/vim-hexokinase", -- NOTE: This needs golang to work
    run = "make hexokinase",
    config = function() require "plugins.configs.others".hexokinase() end
  }

  --
  -- GUI Plugins
  --

  -- Nice notifications on nvim
  use {
    "rcarriga/nvim-notify",
    config = function() vim.notify = require("notify") end
  }

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
  -- Find files
  --

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
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
      "nvim-web-devicons",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }, -- fzf integration
    },
    setup = function() require "plugins.configs.telescope".setup() end,
    config = function() require "plugins.configs.telescope".config() end
  }

  --
  -- Git
  --
  use {
    {
      "lewis6991/gitsigns.nvim",
      opt = true,
      event = { "BufRead","BufNewFile" },
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
  -- LSP (Language Server Protocol)
  --
  use {
    "neovim/nvim-lspconfig",
    opt = true,
    event = "BufReadPre",
    requires = "williamboman/nvim-lsp-installer",
    config = function() require "plugins.configs.lspconfig" end,
  }

  -- Autocomplete/Snippets
  use {
    {
      "L3MON4D3/LuaSnip", -- snippets
      requires = { "rafamadriz/friendly-snippets", event = "InsertEnter" },
      config = function() require "plugins.configs.luasnip_config" end
    },
    {
      "hrsh7th/nvim-cmp",
      module = "cmp",
      after = "LuaSnip",
      event = "InsertEnter",
      requires = {
        { "onsails/lspkind-nvim" }, -- icons in completion menu
        { "tzachar/cmp-tabnine", run = "./install.sh" }, -- tabnine source
        { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp", opt = true },
        { "hrsh7th/cmp-path", after = "nvim-cmp", opt = true },
        { "hrsh7th/cmp-buffer", after = "nvim-cmp", opt = true },
        { "hrsh7th/cmp-cmdline", after = "nvim-cmp", opt = true },
        { "saadparwaiz1/cmp_luasnip", after = { "LuaSnip", "nvim-cmp" }, opt = true },
      },
      config = function() require "plugins.configs.cmp-completion" end
    }
  }

  --
  -- Treesitter (syntax highlight, autopairs and comment strings)
  --
  use {
    {
      "nvim-treesitter/nvim-treesitter",
      branch = "master",
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
      branch = "master",
      after = "nvim-treesitter"
    },
    { "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" },
    { "windwp/nvim-ts-autotag", after = "nvim-treesitter" }
  }
end)
