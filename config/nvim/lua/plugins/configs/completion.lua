local ok_cmp, cmp = pcall(require, "cmp")
local ok_luasnip, luasnip = pcall(require, "luasnip")
local ok_lspkind, lspkind = pcall(require, "lspkind")

if not ok_cmp then
  vim.notify("Couldn't load cmp " .. cmp .. "\n")
elseif not ok_luasnip then
  vim.notify("Couldn't load luasnip " .. luasnip .. "\n")
elseif not ok_lspkind then
  vim.notify("Couldn't load lspkind " .. lspkind .. "\n")
end

local types = require("luasnip.util.types")

-- Luasnip configuration
luasnip.config.set_config {
  history = true,
  enable_autosnippets = true,
  updateevents = "TextChanged,TextChangedI",
  -- Snippets aren't automatically removed if their text is deleted.
  delete_check_events = "TextChanged",
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "choiceNode", "Comment" } },
      },
    },
  },
  -- mapping for cutting selected text (mapped via xmap).
  store_selection_keys = "<Tab>",
}

-- Lazy load Snippets
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  completion = {
    autocomplete = { require('cmp.types').cmp.TriggerEvent.TextChanged },
    completeopt = 'menu,menuone,noselect',
  },
  window = {
    documentation = cmp.config.window.bordered(),
    completion = cmp.config.window.bordered(),
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.get_selected_entry() then -- confirm completion
        cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump() -- jump next snippet placeholder
      else
        fallback() -- else do a simple char <Tab>
      end
    end, { 'i', 's' }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1) -- jump previous snippet placeholder
      else
        fallback() -- else do a simple char <S-Tab>
      end
    end, { 'i', 's' }),
  },
  sources = cmp.config.sources({
    { name = "luasnip" },
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = "path" },
  }),
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = lspkind.cmp_format {
      mode = "symbol",
      menu = {
        luasnip = "[snip]",
        nvim_lsp = "[LSP]",
        buffer = "[buf]",
        path = "[path]",
      },
      before = function(entry, vim_item)
        -- Delete duplicates
        vim_item.dup = ({ luasnip = 0 })[entry.source.name] or 0
        return vim_item
      end,
    },
  },
  experimental = {
    native_menu = false, -- better highlight groups for menubar
    ghost_text = true,   -- nice comment color text of completion
  },
}

-- Use buffer source for /,? (experiemental.native_menu = false)
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline({
    ["<Tab>"] = cmp.mapping({
      c = function(fallback)
        if cmp.get_selected_entry() then -- confirm completion
          cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
        elseif cmp.visible() then
          cmp.select_next_item()
        else
          fallback() -- else do a simple char <Tab>
        end
      end
    }),
  }),
  sources = cmp.config.sources({ { name = 'buffer' } }),
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = lspkind.cmp_format { mode = "symbol" }
  },
})

-- Use cmdline & path source for ':' (experiemental.native_menu = false)
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline({
    ["<Tab>"] = cmp.mapping({
      c = function(fallback)
        if cmp.get_selected_entry() then -- confirm completion
          cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
        elseif cmp.visible() then
          cmp.select_next_item()
        else
          fallback() -- else do a simple char <Tab>
        end
      end
    }),
  }),
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'cmdline' }
  }),
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = lspkind.cmp_format {
      mode = "symbol",
      before = function(entry, vim_item)
        -- Delete duplicates
        vim_item.dup = ({ cmdline = 0 })[entry.source.name] or 0
        return vim_item
      end,
    },
  },
})
