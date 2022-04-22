-- some shorthands...
local ls = require("luasnip")

ls.config.set_config {
  -- I have this on, but might not be necessary
  history = true,
  enable_autosnippets = true,
  -- This one is cool cause if you have dynamic snippets, it updates as you type!
  updateevents = "TextChanged,TextChangedI",
  region_check_events = nil,
}

-- in a vimwiki file: search vimwiki-, then tex-, then all-snippets
ls.filetype_extend("markdown", { "tex" })

require("luasnip.loaders.from_vscode").load()
