local ok, npairs = pcall(require, "nvim-autopairs")

if not ok then
  return
end

local Rule = require("nvim-autopairs.rule")

npairs.setup{
  check_ts = true,
  map_bs = false
}

-- Add spaces between parentheses
npairs.add_rules {
  Rule(' ', ' ')
    :with_pair(function (opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({ '()', '[]', '{}' }, pair)
    end),
  Rule('( ', ' )')
    :with_pair(function() return false end)
    :with_move(function(opts)
      return opts.prev_char:match('.%)') ~= nil
    end)
    :use_key(')'),
  Rule('{ ', ' }')
    :with_pair(function() return false end)
    :with_move(function(opts)
      return opts.prev_char:match('.%}') ~= nil
    end)
    :use_key('}'),
  Rule('[ ', ' ]')
    :with_pair(function() return false end)
    :with_move(function(opts)
      return opts.prev_char:match('.%]') ~= nil
    end)
    :use_key(']')
}
local map = require("core.utils").map
local opt = { noremap = true, expr = true }

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
map('i', '<CR>', 'v:lua.MUtils.CR()', opt)

MUtils.BS = function()
  if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
    return npairs.esc('<C-e>') .. npairs.autopairs_bs()
  else
    return npairs.autopairs_bs()
  end
end
map('i', '<BS>', 'v:lua.MUtils.BS()', opt)

