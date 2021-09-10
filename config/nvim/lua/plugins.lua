local packer = require("packer")
local use = packer.use

return packer.startup(
  function()
    -- Update packer manager
    use { "wbthomason/packer.nvim" }

    --
    -- Miscellaneous
    --
    use { "tpope/vim-commentary" }
    use { "tpope/vim-surround" }

    -- tmux/nvim navigation
    use { "christoomey/vim-tmux-navigator" }

    -- Better text searches
    use { "wincent/loupe" }

    --
    -- GUI Plugins
    --
    use { "akinsho/nvim-bufferline.lua" }

    use {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require "plugins.blankline"
      end
    }

    -- Statusline
    use {
      "glepnir/galaxyline.nvim",
      branch = 'main',
      requires = { "kyazdani42/nvim-web-devicons" },
      config = function()
        require "plugins.statusline"
      end
    }

    use {
      "glepnir/dashboard-nvim",
      config = function()
        require "plugins.dashboard"
      end
    }

    use {
      "kyazdani42/nvim-tree.lua",
      config = function()
        require "plugins.nvim-tree"
      end
    }

    -- Fuzzy finder
    use {
      "nvim-telescope/telescope.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require "plugins.telescope"
      end
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

    --
    -- Git
    --
    use {
      "lewis6991/gitsigns.nvim",
      config = function()
        require("gitsigns").setup()
      end
    }

    use { "tpope/vim-fugitive" }

    --
    -- LSP
    --
    use {
      "neovim/nvim-lspconfig",
      config = function()
        require "plugins.lspconfig"
      end
    }

    -- Manage snippets
    use { "L3MON4D3/LuaSnip" }

    -- Autocomplete
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "onsails/lspkind-nvim",
        "saadparwaiz1/cmp_luasnip"
      },
      config = function()
        require "plugins.cmp"
      end
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
      config = function()
         require "plugins.treesitter"
      end
    }
  end
)
