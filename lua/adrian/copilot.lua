-- ~/.config/nvim/lua/adrian/copilot.lua

require("copilot").setup({
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = "<M-l>",
      accept_word = "<M-w>",
      accept_line = "<M-j>",
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
  panel = {
    enabled = true,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>",
    },
    layout = {
      position = "bottom",
      ratio = 0.4
    },
  },
  filetypes = {
    yaml = false,
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
  copilot_node_command = 'node',
  server_opts_overrides = {},
})

-- Which-key Copilot mappings
local ok, wk = pcall(require, "which-key")
if ok then
  wk.add({
    { "<leader>cp", group = "Copilot" },
    { "<leader>cpe", "<cmd>Copilot enable<cr>", desc = "Enable Copilot" },
    { "<leader>cpd", "<cmd>Copilot disable<cr>", desc = "Disable Copilot" },
    { "<leader>cps", "<cmd>Copilot status<cr>", desc = "Copilot Status" },
    { "<leader>cpp", "<cmd>Copilot panel<cr>", desc = "Copilot Panel" },
  })
end
