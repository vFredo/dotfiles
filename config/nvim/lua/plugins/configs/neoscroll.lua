local ok, neoscroll = pcall(require, "neoscroll")
if not ok then
  vim.notify("Couldn't load neoscroll " .. neoscroll .. "/n")
end

neoscroll.setup {
  respect_scroll_off = true,
  hide_curor = true,
  stop_eof = true,
  cursor_scrolls_alone = false,
  easing_function = "circular"
}

-- Syntax: map[keys] = {function, {function arguments}}
local map    = {}
map['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '100' } }
map['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '100' } }
map['<C-b>'] = { 'scroll', { '-vim.api.nvim_win_get_height(0)', 'true', '100' } }
map['<C-f>'] = { 'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '100' } }
map['<C-y>'] = { 'scroll', { '-0.10', 'false', '100' } }
map['<C-e>'] = { 'scroll', { '0.10', 'false', '100' } }
map['zt']    = { 'zt', { '150' } }
map['zz']    = { 'zz', { '150' } }
map['zb']    = { 'zb', { '150' } }

require("neoscroll.config").set_mappings(map)
