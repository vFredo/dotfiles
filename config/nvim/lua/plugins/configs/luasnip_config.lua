-- some shorthands...
local ls = require("luasnip")
-- local s = ls.snippet
-- local sn = ls.snippet_node
-- local t = ls.text_node
-- local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local l = require("luasnip.extras").lambda
-- local rep = require("luasnip.extras").rep
-- local p = require("luasnip.extras").partial
-- local m = require("luasnip.extras").match
-- local dl = require("luasnip.extras").dynamic_lambda
-- local fmt = require("luasnip.extras.fmt").fmt
-- local types = require("luasnip.util.types")
-- local conds = require("luasnip.extras.expand_conditions")

-- initialize luasnip
-- ls.set_config({})

-- ls.snippets= {
--   tex = {
--     -- Using the condition, it's possible to allow expansion only in specific cases.
-- 		s("frac", {
-- 			t("\\frac{}"),
-- 		}, {
-- 			condition = function(line_to_cursor, matched_trigger, captures)
-- 				-- optional whitespace followed by //
-- 				return line_to_cursor:match("[^$]%a*")
-- 			end,
-- 		}),
--   }
-- }

-- in a vimwiki file: search vimwiki-, then tex-, then all-snippets
ls.filetype_extend("vimwiki", { "tex" })

require("luasnip.loaders.from_vscode").load()
