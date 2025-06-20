-- ~/.config/nvim/lua/adrian/surround.lua

require("nvim-surround").setup({
  keymaps = {
    insert = "<C-g>s",
    insert_line = "<C-g>S",
    normal = "ys",
    normal_cur = "yss",
    normal_line = "yS",
    normal_cur_line = "ySS",
    visual = "S",
    visual_line = "gS",
    delete = "ds",
    change = "cs",
    change_line = "cS",
  },
  surrounds = {
    -- Custom surrounds
    ["("] = {
      add = { "(", ")" },
      find = function()
        return M.get_selection({ motion = "a(" })
      end,
      delete = "^(.).*(.)",
    },
    [")"] = {
      add = { "( ", " )" },
      find = function()
        return M.get_selection({ motion = "a)" })
      end,
      delete = "^(..).*(..)$",
    },
  },
})

-- Which-key mappings for surround
local ok, wk = pcall(require, "which-key")
if ok then
  wk.add({
    { "s", group = "Surround" },
    { "ys", desc = "Add surround" },
    { "yss", desc = "Add surround (line)" },
    { "yS", desc = "Add surround (line)" },
    { "ySS", desc = "Add surround (line)" },
    { "ds", desc = "Delete surround" },
    { "cs", desc = "Change surround" },
    { "cS", desc = "Change surround (line)" },
  })
end
