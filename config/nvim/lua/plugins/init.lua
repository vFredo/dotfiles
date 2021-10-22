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

  -- Comment lines more easily
  use {
    "terrortylor/nvim-comment",
    after = "nvim-treesitter",
    event = "BufRead",
    config = function() require "plugins.configs.others".comment() end
  }

  -- Operation between parenthesis, brackets, etc...
  use {
    "blackCauldron7/surround.nvim",
    config = function() require "plugins.configs.others".surround() end
  }

  -- Navigation between tmux and nvim
  use {
    "numToStr/Navigator.nvim",
    config = function() require "plugins.configs.others".navigator() end
  }

  -- :bdelete, :close and :quit in one smart command
  use { "mhinz/vim-sayonara" }

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
    opt = true,
    cmd = "NvimTreeToggle",
    requires = "nvim-web-devicons",
    config = function() require "plugins.configs.nvim-tree" end
  }

  -- Fuzzy finder (Telescope)
  use {
    "nvim-telescope/telescope.nvim",
    module = "telescope",
    cmd = "Telescope",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
      "nvim-web-devicons",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    },
    config = function() require "plugins.configs.telescope" end
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
      event = "BufRead",
      requires = { "nvim-lua/plenary.nvim" },
      config = function() require "plugins.configs.gitsigns" end
    },
    {
      "TimUntersberger/neogit",
      cmd = "Neogit",
      requires = { "nvim-lua/plenary.nvim" },
      config = function() require "plugins.configs.others".neogit() end
    }
  }

  --
  -- LSP
  --
  use {
    { "williamboman/nvim-lsp-installer" },
    {
      "neovim/nvim-lspconfig",
      opt = true,
      event = "BufRead",
      after = "nvim-lsp-installer",
      config = function() require "plugins.configs.lspconfig" end,
    }
  }

  -- Autocomplete/Snippets
  use {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    module = "cmp",
    after = "LuaSnip",
    requires = {
      { "L3MON4D3/LuaSnip", requires = {"rafamadriz/friendly-snippets", event = "InsertEnter"}}, -- Snippets
      { "onsails/lspkind-nvim" }, -- icons in complete menu
      { "tzachar/cmp-tabnine", run = "./install.sh" }, -- tabnine source
      { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp", opt = true},
      { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp", opt = true },
      { "hrsh7th/cmp-path", after = "nvim-cmp", opt = true },
      { "hrsh7th/cmp-buffer", after = "nvim-cmp", opt = true },
      { "saadparwaiz1/cmp_luasnip", after = {"nvim-cmp", "LuaSnip"}, opt = true },
    },
    config = function() require "plugins.configs.cmp" end
  }

  --
  -- TreeSitter
  --
  use {
    {
      "nvim-treesitter/nvim-treesitter",
      branch = "0.5-compat",
      run = ":TSUpdate",
      config = function()
        require "plugins.configs.treesitter"
      end
    },
    {
      "windwp/nvim-autopairs",
      after = { "nvim-treesitter", "nvim-cmp" },
      config = function() require "plugins.configs.autopairs" end
    },
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      branch = "0.5-compat",
      after = "nvim-treesitter"
    },
    { "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" },
    { "windwp/nvim-ts-autotag", after = "nvim-treesitter"}
  }

  -- Color highlighter for hex, rgb, etc...
  use {
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    config = function() require "plugins.configs.others".colorizer() end
  }
end)
