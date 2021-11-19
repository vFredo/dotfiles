local ok, ts_config = pcall(require, "nvim-treesitter.configs")
if not ok then
  error("Couldn't load Treesitter " .. ts_config .. "\n")
end

ts_config.setup {
  ensure_installed = "maintained",
  highlight = { enable = true },
  indent = { enable = true },
  context_commentstring = { enable = true, enable_autocmd = false },
  autotag = { enable = true },
  autopairs = { enable = true },
  fold = { enable = true },
  textobjects = {
    enable = true,
    keymaps = {
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["aC"] = "@class.outer",
      ["iC"] = "@class.inner",
      ["ac"] = "@conditional.outer",
      ["ic"] = "@conditional.inner",
      ["al"] = "@loop.outer",
      ["il"] = "@loop.inner",
      ["is"] = "@statement.inner",
      ["as"] = "@statement.outer",
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = { ["]m"] = "@function.outer", },
      goto_next_end = { ["]M"] = "@function.outer", },
      goto_previous_start = { ["[m"] = "@function.outer", },
      goto_previous_end = { ["[M"] = "@function.outer", }
    },
    select = {
      enable = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      }
    },
  },
}
