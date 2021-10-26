local ok_cmp, cmp = pcall(require, "cmp")
local ok_luasnip, luasnip = pcall(require, "luasnip")
local ok_lspkind, lspkind = pcall(require, "lspkind")

if not ok_cmp or not ok_luasnip or not ok_lspkind then
  return
end

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- lspkind icon config
lspkind.init( { with_text = true, } )

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
    ["<Tab>"] = cmp.mapping(function(fallback)
      if has_words_before() and cmp.get_selected_entry() then -- confirm completion
        cmp.confirm({behavior = cmp.ConfirmBehavior.Replace, select = true})
      elseif luasnip.expand_or_jumpable() then -- jump next placeholder
        luasnip.expand_or_jump()
      else
        fallback() -- else do a simple char <Tab>
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      -- FIX: Seems like is not working jumping to previous placeholder
      if luasnip.jumpable(-1) then
        luasnip.jump(-1) -- jump previous placeholder
      else
        fallback() -- else do a simple char <S-Tab>
      end
    end, { "i", "s" }),
  },
  sources = {
    -- the order of your sources matter (by default). That gives them priority
    { name = "nvim_lua", max_item_count = 10 },
    { name = 'cmp_tabnine', keyword_length = 3 },
    { name = "nvim_lsp", max_item_count = 10 },
    { name = "luasnip" },
    { name = "buffer", keyword_length = 4 },
    { name = "path", max_item_count = 5 },
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
      local data = entry.completion_item.data
      if entry.source.name == 'cmp_tabnine' then
        if  data ~= nil and data.detail ~= nil then
          -- put tabnine porcentage value if exists
          kind = '' .. ' ' .. data.detail
        else
          kind = ''
        end
      end
      vim_item.kind = kind
      vim_item.menu = source_mapping[entry.source.name]
      return vim_item
    end
  },
  documentation = { border = "rounded" },
  experimental = {
    native_menu = false, -- Better menubar theme
    ghost_text = true,
  },
}

-- nvim-cmp integration with autopairs
require("nvim-autopairs.completion.cmp").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
  auto_select = false, -- automatically select the first item
  insert = false, -- use insert confirm behavior instead of replace
  map_char = { -- modifies the function or method delimiter by filetypes
    all = '(',
    tex = '{'
  }
})
