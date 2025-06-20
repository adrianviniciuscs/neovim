-- ~/.config/nvim/lua/adrian/lint.lua

require("lint").linters_by_ft = {
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  python = { "pylint", "mypy" },
  lua = { "luacheck" },
  markdown = { "markdownlint" },
  yaml = { "yamllint" },
  json = { "jsonlint" },
  sh = { "shellcheck" },
  zsh = { "shellcheck" },
  bash = { "shellcheck" },
  dockerfile = { "hadolint" },
  go = { "golangcilint" },
  rust = { "clippy" },
  c = { "cppcheck" },
  cpp = { "cppcheck" },
}

-- Auto-lint on save and text changed
vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
  group = vim.api.nvim_create_augroup("nvim_lint", { clear = true }),
  callback = function()
    -- Only run linter if file exists on disk and nvim-lint is available
    if vim.fn.filereadable(vim.fn.expand("%")) == 1 then
      local ok, lint = pcall(require, "lint")
      if ok then
        pcall(lint.try_lint)
      end
    end
  end,
})

-- Manual lint command
vim.api.nvim_create_user_command("Lint", function()
  require("lint").try_lint()
end, { desc = "Run linter on current file" })

-- Which-key mappings for linting
local ok, wk = pcall(require, "which-key")
if ok then
  wk.add({
    { "<leader>ll", "<cmd>Lint<cr>", desc = "Run Linter" },
  })
end
