local ok_lspkind, lspkind = pcall(require, "lspkind")
local ok_cmp, cmp = pcall(require, "cmp")
local ok_luasnip, luasnip = pcall(require, "luasnip")

if not ok_cmp or not ok_luasnip or not ok_lspkind  then
  return
end

lspkind.init()

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- Tabnine configuration
local tabnine = require('cmp_tabnine.config')

tabnine:setup({
  sort = true;
  max_lines = 1000;
  max_num_results = 4;
})

cmp.setup {
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.close(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.confirm({behavior = cmp.ConfirmBehavior.Replace, select = true})
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  sources = {
    -- the order of your sources matter (by default). That gives them priority
    { name = 'cmp_tabnine', keyword_length = 3 },
    { name = "nvim_lua" },
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "luasnip" },
    { name = "buffer", keyword_length = 5 },
  },
  completion = {
    autocomplete = {require("cmp.types").cmp.TriggerEvent.TextChanged},
    completeopt = "menu,menuone,noselect"
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  formatting = {
    format = function(entry, vim_item)
      local source_mapping = {
        nvim_lua = "[api]",
        nvim_lsp = "[LSP]",
        path = "[path]",
        luasnip = "[snip]",
        buffer = "[buf]",
        cmp_tabnine = "[tb9]"
      }

      vim_item.kind = lspkind.presets.default[vim_item.kind]
      local menu = source_mapping[entry.source.name]
      if entry.source.name == 'cmp_tabnine' then
        if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
          menu = entry.completion_item.data.detail .. ' ' .. menu
        end
        vim_item.kind = ''
      end
      vim_item.menu = menu
      return vim_item
    end
  },
  documentation = { border = "rounded" },
  experimental = {
    native_menu = false, -- I like the new menu better!
    ghost_text = true,
  },
}
