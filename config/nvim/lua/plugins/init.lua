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

    --
    -- Latex config
    --
    use {
      "lervag/vimtex",
      ft = 'tex',
      config = function()
        vim.g.tex_flavor = "latex"
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_vimtex_quickfix_mode = 2
      end
    }

    use {
      "KeitaNakamura/tex-conceal.vim",
      ft = 'tex',
      config = function()
        vim.opt.conceallevel = 1
        vim.g.tex_conceal = 'abdmg'
      end
    }

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

    -- Icons for nvim-tree, telescope, bufferline, galaxyline
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

    -- Manage snippets
    use {
      "SirVer/ultisnips",
      config = function()
        vim.cmd([[ let g:UltiSnipsSnippetDirectories=[$HOME.'/dotfiles/vim/vimSnips'] ]])
        vim.g.UltiSnipsEditSplit = "vertical"
        vim.g.UltiSnipsRemoveSelectModeMappings = 0
      end
    }

    -- Autocomplete
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "onsails/lspkind-nvim",
        "quangnguyen30192/cmp-nvim-ultisnips"
      },
      config = function()
        require "plugins.configs.cmp"
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
        require "plugins.configs.treesitter"
      end
    }
  end
)
