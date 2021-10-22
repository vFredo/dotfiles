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
    requires = "nvim-web-devicons",
    config = function() require "plugins.configs.nvim-tree" end
  }

  -- Fuzzy finder
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
      "nvim-web-devicons",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
    config = function() require "plugins.configs.telescope" end
  }

  -- Indentation guides/tracking
  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = function() require "plugins.configs.blankline" end
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
    { "neovim/nvim-lspconfig",
      opt = true,
      event = "BufRead",
      after = "nvim-lsp-installer",
      config = function() require "plugins.configs.lspconfig" end,
    }
  }

  -- Autocomplete
  use {
    "ms-jpq/coq_nvim",
    branch = "coq",
    requires = {
      { "ms-jpq/coq.artifacts", branch = "artifacts" },
      { "ms-jpq/coq.thirdparty", branch = "3p" }
    },
    setup = function() require("plugins.configs.coq").setup() end,
    config = function() require("plugins.configs.coq").config() end
  }

  --
  -- TreeSitter
  --
  use {
    {
      "nvim-treesitter/nvim-treesitter",
      requires = "windwp/nvim-autopairs" ,
      branch = "0.5-compat",
      run = ":TSUpdate",
      config = function()
        require "plugins.configs.treesitter"
      end
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
