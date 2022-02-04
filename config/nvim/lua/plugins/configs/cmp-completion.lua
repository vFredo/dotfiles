local ok_cmp, cmp = pcall(require, "cmp")
local ok_luasnip, luasnip = pcall(require, "luasnip")
local ok_lspkind, lspkind = pcall(require, "lspkind")

if not ok_cmp then
  error("Couldn't load cmp " .. cmp .. "\n")
elseif not ok_luasnip then
  error("Couldn't load luasnip " .. luasnip .. "\n")
elseif not ok_lspkind then
  error("Couldn't load lspkind " .. lspkind .. "\n")
end

-- lspkind icon config for completion menu
lspkind.init({
  mode = "symbol_text",
  symbol_map = {
    Text = "",
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
    TypeParameter = "",
  },
})


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
      if cmp.get_selected_entry() then -- confirm completion
        cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump() -- jump next snippet placeholder
      else
        fallback() -- else do a simple char <Tab>
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1) -- jump previous snippet placeholder
      else
        fallback() -- else do a simple char <S-Tab>
      end
    end, { "i", "s" }),
  },
  sources = {
    -- the order of your sources matter (by default). That gives them priority
    { name = 'cmp_tabnine' },
    { name = "nvim_lsp", max_item_count = 4 },
    { name = "luasnip" },
    { name = "buffer", keyword_length = 3 },
    { name = "path", max_item_count = 4 },
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  formatting = {
    format = function(entry, vim_item)
      local source_mapping = {
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
          -- put tabnine porcentage value if it exist
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
    native_menu = false, -- better highlight groups for menubar
    ghost_text = true,   -- nice comment color text of completion
  },
}
