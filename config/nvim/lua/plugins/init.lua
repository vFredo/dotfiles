--
-- Check if packer is installed
--
local present, packer = pcall(require, "plugins.packerInit")

if not present then
   return false
end

local use = packer.use

return packer.startup(function()
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
    config = function()
      require('nvim_comment').setup {
        hook = function()
          local ts_comment = require("ts_context_commentstring.internal")
          ts_comment.update_commentstring()
        end,
        comment_empty = false
      }
    end
  }

  -- Operation between parenthesis, brackets, etc...
  use {
    "blackCauldron7/surround.nvim",
    config = function()
      require("surround").setup {
        mappings_style = "sandwich",
        map_insert_mode = false
      }
    end
  }

  -- tmux/nvim navigation
  use { "christoomey/vim-tmux-navigator" }

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
    config = function() require "plugins.configs.devicons" end
  }

  -- Bufferline
  use {
    "akinsho/nvim-bufferline.lua",
    after = "nvim-web-devicons",
    config = function() require "plugins.configs.bufferline" end
  }

  -- Statusline
  use {
    "famiu/feline.nvim",
    branch = "master",
    after = "nvim-web-devicons",
    config = function() require "plugins.configs.statusline" end
  }

  -- Tree view of the project
  use {
    "kyazdani42/nvim-tree.lua",
    after = "nvim-web-devicons",
    config = function() require "plugins.configs.nvim-tree" end
  }

  -- Fuzzy finder
  use {
    "nvim-telescope/telescope.nvim",
    after = "nvim-web-devicons",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
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
    config = function()
      require("neoscroll").setup {
        use_local_scrolloff = true,
        easing_function = "circular"
      }
    end
  }

  --
  -- Git
  --
  use {
    {
      "lewis6991/gitsigns.nvim",
      event = "BufRead",
      requires = { "nvim-lua/plenary.nvim" },
      config = function() require "plugins.configs.gitsigns" end
    },
    {
      "TimUntersberger/neogit",
      cmd = 'Neogit',
      requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require("neogit").setup {
          disable_signs = true,
          disable_commit_confirmation = true
        }
      end
    }
  }

  --
  -- LSP
  --
  use {
    "neovim/nvim-lspconfig",
    event = "BufRead",
    requires = { "williamboman/nvim-lsp-installer" },
    config = function() require "plugins.configs.lspconfig" end
  }

  -- Autocomplete
  use {
    "ms-jpq/coq_nvim",
    branch = "coq",
    requires = {
      { "ms-jpq/coq.artifacts", branch = "artifacts" },
      { "ms-jpq/coq.thirdparty", branch = "3p" }
    },
    setup = function() require "plugins.configs.coq_setup" end,
    config = function()
      require "plugins.configs.coq"
      vim.cmd([[ COQnow --shut-up ]])
    end
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
    config = function()
      require("colorizer").setup({"*"}, {
        names = false,   -- "Name" codes like 'Blue'
        RRGGBB = true,   -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true,   -- CSS rgb() and rgba() functions
      })
      vim.cmd "ColorizerReloadAllBuffers"
    end
  }
end)
