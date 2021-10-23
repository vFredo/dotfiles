local ok_lspkind, lspkind = pcall(require, "lspkind")
local ok_cmp, cmp = pcall(require, "cmp")
local ok_luasnip, luasnip = pcall(require, "luasnip")

if not ok_cmp or not ok_luasnip or not ok_lspkind  then
  return
end

lspkind.init( { with_text = true, } )

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- Tabnine configuration
local tabnine = require('cmp_tabnine.config')

tabnine:setup({
  max_lines = 1000;
  max_num_results = 4;
  sort = true;
	run_on_every_keystroke = true;
	snippet_placeholder = '..';
})

cmp.setup {
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.close(),
    -- confirm autocomplete = <Tab>
    -- jump next place holder = <Tab> (this happens when there's no selection)
    ["<Tab>"] = cmp.mapping(function(fallback)
      if has_words_before() and cmp.get_selected_entry() then
        cmp.confirm({behavior = cmp.ConfirmBehavior.Replace, select = true})
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback() -- else do a simple char <Tab>
      end
    end, { "i", "s" }),
    -- FIX: <S-Tab> seems like is not working
    -- jump prev place holder = <S-Tab>
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback() -- else do a simple char <S-Tab>
      end
    end, { "i", "s" }),
  },
  sources = {
    -- the order of your sources matter (by default). That gives them priority
    { name = "nvim_lua" },
    { name = 'cmp_tabnine', keyword_length = 3 },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer", keyword_length = 5 },
    { name = "path" },
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  formatting = {
    format = function(entry, vim_item)
      local source_mapping = {
        nvim_lua = "[lua]",
        nvim_lsp = "[LSP]",
        path = "[path]",
        luasnip = "[snip]",
        buffer = "[buf]",
        cmp_tabnine = "[tb9]"
      }
      local kind = lspkind.presets.default[vim_item.kind] .. ' ' .. vim_item.kind
      if entry.source.name == 'cmp_tabnine' then
        if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
          kind = '' .. ' ' .. entry.completion_item.data.detail -- tabnine porcentage assertion
        end
      end
      vim_item.kind = kind
      vim_item.menu = source_mapping[entry.source.name]
      return vim_item
    end
  },
  documentation = { border = "rounded" },
  experimental = {
    native_menu = false, -- I like the new menu better!
    ghost_text = true,
  },
}
