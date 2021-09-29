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
    use {
      "wincent/loupe",
      config = function()
        vim.g.LoupeCenterResults = 0
      end
    }

    --
    -- GUI Plugins
    --

    -- Icons for telescope, bufferline, galaxyline
    use {
      "kyazdani42/nvim-web-devicons",
      config = function()
        require("nvim-web-devicons").setup{
          override = {
            js = {
              icon = "",
              color = "#FFC745",
              name = "js"
            }
          }
        }
      end
    }

    -- Bufferline
    use { "akinsho/nvim-bufferline.lua" }

    use {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require "plugins.configs.blankline"
      end
    }

    -- Statusline
    use {
      "glepnir/galaxyline.nvim",
      config = function()
        require "plugins.configs.statusline"
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
            tabnine = {
              enabled = true,
            }
          }
        }
        vim.cmd([[
          ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
          ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
          ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
          ino <silent><expr> <Tab>   pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<Tab>"
        ]])
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
  end
)
