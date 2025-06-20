-- ~/.config/nvim/lua/adrian/cmp.lua

local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

-- Carregar snippets do friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- Custom snippets
luasnip.config.setup({
  history = true,
  updateevents = "TextChanged,TextChangedI",
  delete_check_events = "TextChanged",
  ext_opts = {
    [require("luasnip.util.types").choiceNode] = {
      active = {
        virt_text = { { "choiceNode", "Comment" } },
      },
    },
  },
})

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  
  window = {
    completion = cmp.config.window.bordered({
      border = "rounded",
      winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
    }),
    documentation = cmp.config.window.bordered({
      border = "rounded",
      winhighlight = "Normal:CmpDoc",
    }),
  },
  
  mapping = cmp.mapping.preset.insert({
    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    
    -- Super Tab
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  
  sources = cmp.config.sources({
    { name = "nvim_lsp", priority = 1000 },
    { name = "luasnip", priority = 750 },
    { name = "buffer", priority = 500 },
    { name = "path", priority = 250 },
    { name = "nvim_lua", priority = 800 }, -- Neovim Lua API
    { name = "emoji", priority = 100 },
  }),
  
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text",
      maxwidth = 50,
      ellipsis_char = "...",
      show_labelDetails = true,
      
      -- The function below will be called before any actual modifications from lspkind
      before = function(entry, vim_item)
        -- Source
        vim_item.menu = ({
          nvim_lsp = "[LSP]",
          luasnip = "[Snippet]",
          buffer = "[Buffer]",
          path = "[Path]",
          nvim_lua = "[Lua]",
          emoji = "[Emoji]",
          cmdline = "[CMD]",
        })[entry.source.name]
        
        return vim_item
      end,
    }),
  },
  
  experimental = {
    ghost_text = {
      hl_group = "CmpGhostText",
    },
  },
  
  sorting = {
    priority_weight = 2,
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" }
  }, {
    { name = "cmdline" }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

-- Autopairs integration
require("nvim-autopairs").setup({
  check_ts = true,
  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" },
    java = false,
  },
  disable_filetype = { "TelescopePrompt", "spectre_panel" },
  fast_wrap = {
    map = "<M-e>",
    chars = { "{", "[", "(", '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0,
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "PmenuSel",
    highlight_grey = "LineNr",
  },
})

-- Autopairs cmp integration
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- Highlight groups for better appearance
vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

-- LuaSnip keymaps
vim.keymap.set({ "i", "s" }, "<C-L>", function() luasnip.jump(1) end, { silent = true, desc = "Jump forward in snippet" })
vim.keymap.set({ "i", "s" }, "<C-H>", function() luasnip.jump(-1) end, { silent = true, desc = "Jump backward in snippet" })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
  if luasnip.choice_active() then
    luasnip.change_choice(1)
  end
end, { silent = true, desc = "Change choice in snippet" })

