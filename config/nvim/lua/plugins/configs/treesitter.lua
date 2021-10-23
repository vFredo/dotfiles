local ok, treesitter = pcall(require, "nvim-treesitter")
if not ok then
  return
end

treesitter.define_modules {
  fold = {
    attach = function(_, _)
      vim.cmd'set foldmethod=expr foldexpr=nvim_treesitter#foldexpr()'
    end,
    detach = function() end,
  }
}

local ts_config = require("nvim-treesitter.configs")

ts_config.setup {
  ensure_installed = "maintained",
  highlight = { enable = true },
  indent = { enable = true },
  context_commentstring = { enable = true, enable_autocmd = false },
  autotag = { enable = true },
  autopairs = { enable = true },
  fold = { enable = true, disable = {'rst', 'python'} },
  textobjects = {
    enable = true,
    keymaps = {
      ["iL"] = {
        -- you can define your own textobjects directly here
        python = "(function_definition) @function",
        cpp = "(function_definition) @function",
        c = "(function_definition) @function",
        go = "(function_definition) @function",
        java = "(method_declaration) @function"
      },
      -- or you use the queries from supported languages with textobjects.scm
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["aC"] = "@class.outer",
      ["iC"] = "@class.inner",
      ["ac"] = "@conditional.outer",
      ["ic"] = "@conditional.inner",
      ["ae"] = "@block.outer",
      ["ie"] = "@block.inner",
      ["al"] = "@loop.outer",
      ["il"] = "@loop.inner",
      ["is"] = "@statement.inner",
      ["as"] = "@statement.outer",
      ["ad"] = "@comment.outer",
      ["am"] = "@call.outer",
      ["im"] = "@call.inner"
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer"
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer"
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer"
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer"
      }
    },
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        -- Or you can define your own textobjects like this
        ["iF"] = {
          python = "(function_definition) @function",
          cpp = "(function_definition) @function",
          c = "(function_definition) @function",
          java = "(method_declaration) @function",
          go = "(method_declaration) @function"
        }
      }
    },
  },
}
