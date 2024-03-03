return {
  {
    -- Snippets engine
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    dependencies = { "rafamadriz/friendly-snippets" },
    build = "make install_jsregexp",
    config = function()
      -- Luasnip configuration
      require("luasnip").config.set_config({
        history = true,
        enable_autosnippets = true,
        updateevents = "TextChanged,TextChangedI",
        -- Snippets aren't automatically removed if their text is deleted.
        delete_check_events = "TextChanged",
        -- mapping for cutting selected text (mapped via xmap).
        store_selection_keys = "<Tab>",
        ext_opts = {
          [require("luasnip.util.types").choiceNode] = {
            active = { virt_text = { { "↺", "Comment" } } },
          },
        },
      })
      -- Lazy load snippets vscode format
      require("luasnip.loaders.from_vscode").lazy_load()
      -- Lazy load custom snippets lua format
      require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/snippets/" })

      -- Automatically unlink the current snippet from the buffer
      -- when the insert mode is left, but only if there are any
      -- current nodes in the Luasnip session for the buffer
      vim.api.nvim_create_autocmd("InsertLeave", {
        callback = function()
          if
              require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
              and not require("luasnip").session.jump_active
          then
            require("luasnip").unlink_current()
          end
        end,
      })
    end
  },
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "onsails/lspkind-nvim", -- icons in completion menu
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      -- snippets engine
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      cmp.setup({
        view = { entries = "custom" },
        window = {
          documentation = cmp.config.window.bordered(),
          completion = cmp.config.window.bordered({
            border = "none",
            col_offset = -2,
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None"
          }),
        },
        completion = {
          autocomplete = { require('cmp.types').cmp.TriggerEvent.TextChanged },
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = {
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-p>'] = cmp.mapping({
            i = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
            c = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select })
          }),
          ['<C-n>'] = cmp.mapping({
            i = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
            c = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select })
          }),
          ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.close(),
            c = cmp.mapping.close()
          }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump() -- jump next snippet placeholder
            else
              fallback()
            end
          end, { "i", "s", "c" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1) -- jump previous snippet placeholder
            else
              fallback()       -- else do a simple char <S-Tab>
            end
          end, { "i", "s", "c" })
        },
        sources = cmp.config.sources({
          { name = "path",     priority_weight = 110 },
          { name = "orgmode",  priority_weight = 110 },
          { name = "nvim_lsp", max_item_count = 20,  priority_weight = 100 },
          { name = "luasnip",  priority_weight = 80 },
          { name = "buffer",   priority_weight = 50 },
        }),
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = lspkind.cmp_format({
            mode = "symbol",
            menu = {
              luasnip = "[snip]",
              nvim_lsp = "[LSP]",
              buffer = "[buf]",
              path = "[path]",
              cmdline = "[cmd]",
              orgmode = "[org]"
            },
            before = function(entry, vim_item)
              -- Delete duplicates
              vim_item.dup = ({ luasnip = 0 })[entry.source.name] or 0
              return vim_item
            end,
          }),
        },
        experimental = {
          ghost_text = { hl_group = "Comment" } -- nice comment color text of completion
        },
      })

      -- Use buffer source for /,?
      cmp.setup.cmdline({ '/', '?' }, {
        sources = cmp.config.sources({
          { name = 'buffer', max_item_count = 8 }
        }),
      })

      -- Use cmdline & path source for ':'
      cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
          { name = 'cmdline' },
          { name = 'path' }
        }),
      })
    end
  },
}
