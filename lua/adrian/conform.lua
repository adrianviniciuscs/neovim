-- ~/.config/nvim/lua/adrian/conform.lua

-- Conform.nvim - Modern formatter
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    javascript = { { "prettierd", "prettier" } },
    typescript = { { "prettierd", "prettier" } },
    javascriptreact = { { "prettierd", "prettier" } },
    typescriptreact = { { "prettierd", "prettier" } },
    json = { { "prettierd", "prettier" } },
    yaml = { { "prettierd", "prettier" } },
    markdown = { { "prettierd", "prettier" } },
    html = { { "prettierd", "prettier" } },
    css = { { "prettierd", "prettier" } },
    scss = { { "prettierd", "prettier" } },
    c = { "clang_format" },
    cpp = { "clang_format" },
    rust = { "rustfmt" },
    go = { "gofmt" },
    sh = { "shfmt" },
    bash = { "shfmt" },
    zsh = { "shfmt" },
  },
  
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
  
  format_after_save = {
    lsp_fallback = true,
  },
  
  -- Customize formatters
  formatters = {
    stylua = {
      prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
    },
    shfmt = {
      prepend_args = { "-i", "2" },
    },
  },
})

-- Keymaps
vim.keymap.set({ "n", "v" }, "<leader>lf", function()
  require("conform").format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  })
end, { desc = "Format file or range (in visual mode)" })

-- Which-key mappings
local ok, wk = pcall(require, "which-key")
if ok then
  wk.add({
    { "<leader>lf", function() require("conform").format({ lsp_fallback = true }) end, desc = "Format Document" },
    { "<leader>lF", "<cmd>ConformInfo<cr>", desc = "Conform Info" },
  })
end
