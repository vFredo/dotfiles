-- For coq bidnings
local remap = vim.api.nvim_set_keymap

remap('i', '<Esc>', [[pumvisible() ? "<C-e><Esc>" : "<Esc>"]], { expr = true, noremap = true })
remap('i', '<C-c>', [[pumvisible() ? "<C-e><C-c>" : "<C-c>"]], { expr = true, noremap = true })
remap('i', '<Tab>', [[pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<Tab>"]], { expr = true, noremap = true })

local npairs = require("nvim-autopairs")

_G.MUtils= {}

MUtils.CR = function()
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
      return npairs.esc('<C-y>')
    else
      return npairs.esc('<C-e>') .. npairs.autopairs_cr()
    end
  else
    return npairs.autopairs_cr()
  end
end
remap('i', '<CR>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })

MUtils.BS = function()
  if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
    return npairs.esc('<c-e>') .. npairs.autopairs_bs()
  else
    return npairs.autopairs_bs()
  end
end
remap('i', '<BS>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })
