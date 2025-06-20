-- ~/.config/nvim/lua/adrian/theme.lua

-- Load themes manager
local themes = require("adrian.themes")

-- Load saved theme or apply default
themes.load_saved_theme()

-- Custom highlights
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- Custom highlights for better visibility
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#E5C07B", bold = true })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#5C6370" })
  end,
})

-- Keymaps for quick theme switching
vim.keymap.set("n", "<leader>tt", function()
  require("adrian.theme-picker").pick_theme()
end, { desc = "Theme Picker (All)" })

vim.keymap.set("n", "<leader>tc", function()
  require("adrian.theme-picker").pick_theme_by_category()
end, { desc = "Theme Categories" })

vim.keymap.set("n", "<leader>tf", function()
  require("adrian.theme-picker").pick_favorite_themes()
end, { desc = "Favorite Themes" })

vim.keymap.set("n", "<leader>tr", function()
  themes.random_theme()
end, { desc = "Random Theme" })

vim.keymap.set("n", "<leader>tn", function()
  themes.next_theme()
end, { desc = "Next Theme" })

vim.keymap.set("n", "<leader>tp", function()
  themes.prev_theme()
end, { desc = "Previous Theme" })

-- Quick access to popular themes
vim.keymap.set("n", "<leader>t1", function() themes.apply_theme("catppuccin") end, { desc = "Catppuccin" })
vim.keymap.set("n", "<leader>t2", function() themes.apply_theme("tokyonight") end, { desc = "Tokyo Night" })
vim.keymap.set("n", "<leader>t3", function() themes.apply_theme("rose-pine") end, { desc = "Rose Pine" })
vim.keymap.set("n", "<leader>t4", function() themes.apply_theme("kanagawa") end, { desc = "Kanagawa" })
vim.keymap.set("n", "<leader>t5", function() themes.apply_theme("gruvbox") end, { desc = "Gruvbox" })
vim.keymap.set("n", "<leader>t6", function() themes.apply_theme("nord") end, { desc = "Nord" })
vim.keymap.set("n", "<leader>t7", function() themes.apply_theme("dracula") end, { desc = "Dracula" })
vim.keymap.set("n", "<leader>t8", function() themes.apply_theme("material") end, { desc = "Material" })
vim.keymap.set("n", "<leader>t9", function() themes.apply_theme("onedark") end, { desc = "One Dark" })
vim.keymap.set("n", "<leader>t0", function() themes.apply_theme("nightfox") end, { desc = "Nightfox" })

-- Which-key theme mappings
local ok, wk = pcall(require, "which-key")
if ok then
  wk.add({
    { "<leader>t", group = "Themes" },
    { "<leader>tt", desc = "Theme Picker (All)" },
    { "<leader>tc", desc = "Theme Categories" },
    { "<leader>tf", desc = "Favorite Themes" },
    { "<leader>tr", desc = "Random Theme" },
    { "<leader>tn", desc = "Next Theme" },
    { "<leader>tp", desc = "Previous Theme" },
    { "<leader>t1", desc = "Catppuccin" },
    { "<leader>t2", desc = "Tokyo Night" },
    { "<leader>t3", desc = "Rose Pine" },
    { "<leader>t4", desc = "Kanagawa" },
    { "<leader>t5", desc = "Gruvbox" },
    { "<leader>t6", desc = "Nord" },
    { "<leader>t7", desc = "Dracula" },
    { "<leader>t8", desc = "Material" },
    { "<leader>t9", desc = "One Dark" },
    { "<leader>t0", desc = "Nightfox" },
  })
end

