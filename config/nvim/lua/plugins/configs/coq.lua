local M = {  }

--
-- Setup
--
M.setup = function()
  -- COQ configs, this has to be done before excution of coq
  vim.g.coq_settings = {
    auto_start = false,
    ["keymap.recommended"] = false,
    ["keymap.jump_to_mark"] = "<s-tab>",
    ["keymap.manual_complete"] = "<c-n>",
    ["keymap.eval_snips"] = "<leader>j",
    ["keymap.repeat"] = ".",
    ["clients.tabnine.enabled"] = true,
    ["clients.tabnine.short_name"] = "TAB9",
    ["clients.tabnine.weight_adjust"] = 1.3,
    ["clients.paths.short_name"] = "PATH",
    ["clients.paths.weight_adjust"] = 1.1,
    ["clients.tree_sitter.short_name"] = "TREE",
    ["clients.tree_sitter.weight_adjust"] = 1.2,
    ["clients.tmux.short_name"] = "TMUX",
    ["clients.snippets.short_name"] = "SNIP",
    ["clients.snippets.weight_adjust"] = 0.8,
    ["display.icons.mappings"] = {
      Text = " ",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "ﰠ",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = ""
    }
  }
end

--
-- Configuration
--
M.config = function()
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

  -- Start COQ
  vim.cmd([[ COQnow --shut-up ]])
end

return M
