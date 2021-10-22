-- For coq bidnings and windp/nvim-autopairs integration
local function remap(mode, lhs, rhs, opts)
  local options = { noremap = true, expr = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {  }

remap('i', '<Esc>', [[pumvisible() ? "<C-e><Esc>" : "<Esc>"]], opt)
remap('i', '<C-c>', [[pumvisible() ? "<C-e><C-c>" : "<C-c>"]], opt)
remap('i', '<Tab>', [[pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<Tab>"]], opt)

local npairs = require("nvim-autopairs")

_G.MUtils= {  }

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
remap('i', '<CR>', 'v:lua.MUtils.CR()', opt)

MUtils.BS = function()
  if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
    return npairs.esc('<C-e>') .. npairs.autopairs_bs()
  else
    return npairs.autopairs_bs()
  end
end
remap('i', '<BS>', 'v:lua.MUtils.BS()', opt)
