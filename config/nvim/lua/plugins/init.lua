local packer = require("packer")
local use = packer.use

return packer.startup(
  function()
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

    -- Better text searches
    use {
      "wincent/loupe",
      config = function()
        vim.g.LoupeCenterResults = 0
      end
    }

    --
    -- GUI Plugins
    --

    -- Icons for telescope, bufferline, feline (statusline)
    use {
      "kyazdani42/nvim-web-devicons",
      config = function()
        require("nvim-web-devicons").setup{
          override = {
            js = {
              name = "js",
              icon = "",
              color = "#FFC745"
            }
          }
        }
      end
    }

    -- Bufferline
    use {
      "akinsho/nvim-bufferline.lua",
      config = function()
        require "plugins.configs.bufferline"
      end
    }

    -- Indentation guide
    use {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require "plugins.configs.blankline"
      end
    }

    -- Statusline
    use {
      'famiu/feline.nvim',
      config = function()
        require "plugins.configs.statusline"
      end
    }

    -- Tree view of the files
    use {
      "kyazdani42/nvim-tree.lua",
      config = function()
        require "plugins.configs.nvim-tree"
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

    -- Fuzzy finder
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-fzy-native.nvim"
      },
      config = function()
        require "plugins.configs.telescope"
      end
    }

    --
    -- Git
    --
    use {
      "lewis6991/gitsigns.nvim",
      config = function()
        require("gitsigns").setup{
          keymaps = { noremap = false }
        }
      end
    }

    use { "tpope/vim-fugitive" }

    --
    -- LSP
    --
    use {
      "neovim/nvim-lspconfig",
      config = function()
        require "plugins.configs.lspconfig"
      end
    }

    -- Autocomplete
    use {
      'ms-jpq/coq_nvim',
      branch = 'coq',
      setup = function()
        vim.g.coq_settings = {
          auto_start = 'shut-up',
          ["keymap.recommended"] = false,
          ["keymap.jump_to_mark"] = "<c-b>",
          ["keymap.manual_complete"] = "<c-n>",
          clients = {
            tabnine = { enabled = true }
          }
        }
      end,
      config =  function()
        require "plugins.configs.coq"
      end
    }

    -- Snippets for coq_nvim
    use { 'ms-jpq/coq.artifacts', branch = 'artifacts' }

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
        require "plugins.configs.treesitter"
      end
    }

    -- Color highlighter for hex, rgb, etc...
    use {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup{
          css = { rgb_fn = true }
        }
      end
    }
  end
)
