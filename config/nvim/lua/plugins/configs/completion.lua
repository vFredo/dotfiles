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

-- Luasnip configuration
luasnip.config.set_config {
  -- This might not be necessary
  history = true,
  enable_autosnippets = true,
  -- Update as you type with dynamic snippets
  updateevents = "TextChanged,TextChangedI",
  region_check_events = nil,
}

require("luasnip.loaders.from_vscode").lazy_load()

-- Tabnine configuration
local tabnine = require('cmp_tabnine.config')

tabnine:setup({
  max_lines = 1000;
  max_num_results = 6;
  sort = true;
  run_on_every_keystroke = true;
  snippet_placeholder = '..';
})

local compare = cmp.config.compare

cmp.setup {
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
    { name = "cmp_tabnine" },
    { name = "nvim_lsp", max_item_count = 15 },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = "path", max_item_count = 4 },
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = lspkind.cmp_format {
      mode = "symbol",
      menu = {
        nvim_lsp = "[LSP]",
        path = "[path]",
        luasnip = "[snip]",
        buffer = "[buf]",
        cmp_tabnine = "[tb9]",
        cmdline = "[cmd]"
      },
      before = function(entry, vim_item)
        if entry.source.name == 'cmp_tabnine' then
          vim_item.kind = "Event"
        elseif entry.source.name == 'cmdline' then
          vim_item.kind = "TypeParameter"
        end
        return vim_item
      end,
    },
  },
  window = { documentation = { border = "rounded" } },
  sorting = {
    comparators = {
      compare.locality,
      compare.recently_used,
      compare.score,
      compare.offset,
      compare.order
    }
  },
  experimental = {
    native_menu = false, -- better highlight groups for menubar
    ghost_text = true, -- nice comment color text of completion
  },
}

-- Use buffer source for `/` (experiemental.native_menu = false)
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  formatting = { format = lspkind.cmp_format { mode = "symbol" } },
  sources = { { name = 'buffer' } }
})

-- Use cmdline & path source for ':' (experiemental.native_menu = false)
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  formatting = { format = lspkind.cmp_format { mode = "symbol" } },
  sources = { { name = 'path' }, { name = "cmdline" } }
})