-- --- Telescope ---
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })

-- --- WhichKey ---
local wk = require("which-key")
wk.setup({})
wk.register({
  f = {
    name = "Find",
    f = "Find Files",
    g = "Grep",
    b = "Buffers",
    h = "Help Tags",
  },
  c = {
    name = "Comment",
    c = "Toggle Line Comment",
    b = "Toggle Block Comment",
  },
}, { prefix = "<leader>", mode = "n" })

wk.register({
  g = {
    name = "Comment",
    c = "Toggle Linewise Comment",
    b = "Toggle Blockwise Comment",
  },
}, { prefix = "", mode = "v" })

-- --- nvim-cmp ---
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  }),
})

cmp.setup.cmdline('/', {
  sources = { { name = 'buffer' } }
})
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } })
})

-- --- LSP ---
local lspconfig = require('lspconfig')
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

mason.setup()

mason_lspconfig.setup({
  ensure_installed = {
    'lua_ls',
    'pyright',
    'tsserver', -- nome correto!
    'html',
    'cssls',
    'jsonls',
    'clangd',
  }
})

local on_attach = function(client, bufnr)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr })
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr })
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = bufnr })
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = bufnr })
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr })
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr })
  vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, { buffer = bufnr })
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { buffer = bufnr })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { buffer = bufnr })
end

-- Protegido contra versões antigas de mason-lspconfig
if mason_lspconfig.setup_handlers then
  mason_lspconfig.setup_handlers({
    function(server_name)
      lspconfig[server_name].setup({
        on_attach = on_attach,
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      })
    end,
  })
else
  -- fallback (manual)
  local servers = mason_lspconfig.get_installed_servers()
  for _, name in ipairs(servers) do
    lspconfig[name].setup({
      on_attach = on_attach,
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    })
  end
end

-- --- Null-LS ---
local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.clang_format,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("Format", { clear = true }),
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 1500 })
        end,
      })
    end
  end,
})

-- --- Copilot ---
require('copilot').setup({
  suggestion = {
    enabled = true,
    auto_trigger = true,
    keymap = {
      accept = "<C-CR>",
      dismiss = "<C-x>",
      next = "<C-]>",
      prev = "<C-[>",
    },
  },
  panel = {
    enabled = true,
    keymap = {
      open = "<M-CR>",
    },
  },
})

-- --- Tema ---
vim.cmd.colorscheme 'catppuccin'

