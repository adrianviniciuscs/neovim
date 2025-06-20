-- ~/.config/nvim/lua/adrian/theme-picker.lua

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local themes = require("adrian.themes")

local M = {}

-- Função para criar o picker de temas
function M.pick_theme()
  local opts = {}
  
  pickers.new(opts, {
    prompt_title = "🎨 Theme Selector",
    finder = finders.new_table {
      results = themes.themes,
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry.display_name,
          ordinal = entry.display_name,
        }
      end,
    },
    sorter = conf.generic_sorter(opts),
    previewer = false,
    layout_config = {
      height = 0.5,
      width = 0.6,
    },
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        if selection then
          themes.apply_theme(selection.value.name)
        end
      end)
      
      -- Preview theme on cursor move (optional)
      map("i", "<C-p>", function()
        local selection = action_state.get_selected_entry()
        if selection then
          themes.apply_theme(selection.value.name)
        end
      end)
      
      return true
    end,
  }):find()
end

-- Função para picker de temas por categoria
function M.pick_theme_by_category()
  local categories = {
    { name = "Dark Themes", filter = function(theme) 
      return not string.match(theme.display_name:lower(), "light") and 
             not string.match(theme.display_name:lower(), "dawn") and
             not string.match(theme.display_name:lower(), "day")
    end },
    { name = "Light Themes", filter = function(theme) 
      return string.match(theme.display_name:lower(), "light") or 
             string.match(theme.display_name:lower(), "dawn") or
             string.match(theme.display_name:lower(), "day")
    end },
    { name = "Catppuccin Variants", filter = function(theme) 
      return string.match(theme.name, "catppuccin")
    end },
    { name = "Tokyo Night Variants", filter = function(theme) 
      return string.match(theme.name, "tokyonight")
    end },
    { name = "Material Variants", filter = function(theme) 
      return string.match(theme.name, "material")
    end },
    { name = "Gruvbox Variants", filter = function(theme) 
      return string.match(theme.name, "gruvbox")
    end },
    { name = "Built-in Themes", filter = function(theme) 
      local builtin = {"default", "blue", "darkblue", "delek", "desert", "elflord", "evening", "habamax", "industry", "koehler", "lunaperche", "morning", "murphy", "pablo", "peachpuff", "quiet", "ron", "shine", "slate", "torte", "zellner"}
      for _, builtin_theme in ipairs(builtin) do
        if theme.name == builtin_theme then
          return true
        end
      end
      return false
    end },
  }
  
  pickers.new({}, {
    prompt_title = "🗂️ Theme Categories",
    finder = finders.new_table {
      results = categories,
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry.name,
          ordinal = entry.name,
        }
      end,
    },
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        if selection then
          M.pick_theme_from_category(selection.value)
        end
      end)
      return true
    end,
  }):find()
end

-- Função para picker de temas de uma categoria específica
function M.pick_theme_from_category(category)
  local filtered_themes = {}
  for _, theme in ipairs(themes.themes) do
    if category.filter(theme) then
      table.insert(filtered_themes, theme)
    end
  end
  
  pickers.new({}, {
    prompt_title = "🎨 " .. category.name,
    finder = finders.new_table {
      results = filtered_themes,
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry.display_name,
          ordinal = entry.display_name,
        }
      end,
    },
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        if selection then
          themes.apply_theme(selection.value.name)
        end
      end)
      
      -- Preview on move
      map("i", "<C-p>", function()
        local selection = action_state.get_selected_entry()
        if selection then
          themes.apply_theme(selection.value.name)
        end
      end)
      
      return true
    end,
  }):find()
end

-- Função para favoritos
function M.pick_favorite_themes()
  local favorites = {
    "catppuccin",
    "tokyonight",
    "rose-pine",
    "kanagawa",
    "gruvbox",
    "nord",
    "dracula",
    "material",
    "onedark",
    "nightfox"
  }
  
  local favorite_themes = {}
  for _, fav_name in ipairs(favorites) do
    for _, theme in ipairs(themes.themes) do
      if theme.name == fav_name then
        table.insert(favorite_themes, theme)
        break
      end
    end
  end
  
  pickers.new({}, {
    prompt_title = "⭐ Favorite Themes",
    finder = finders.new_table {
      results = favorite_themes,
      entry_maker = function(entry)
        return {
          value = entry,
          display = "⭐ " .. entry.display_name,
          ordinal = entry.display_name,
        }
      end,
    },
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        if selection then
          themes.apply_theme(selection.value.name)
        end
      end)
      return true
    end,
  }):find()
end

return M
