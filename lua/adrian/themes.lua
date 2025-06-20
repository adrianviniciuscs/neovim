-- ~/.config/nvim/lua/adrian/themes.lua

local M = {}

-- Lista completa de temas disponíveis
M.themes = {
  -- Catppuccin variants
  { name = "catppuccin", display_name = "Catppuccin Mocha (Default)" },
  { name = "catppuccin-latte", display_name = "Catppuccin Latte (Light)" },
  { name = "catppuccin-frappe", display_name = "Catppuccin Frappe" },
  { name = "catppuccin-macchiato", display_name = "Catppuccin Macchiato" },
  
  -- Tokyo Night variants
  { name = "tokyonight", display_name = "Tokyo Night" },
  { name = "tokyonight-night", display_name = "Tokyo Night (Night)" },
  { name = "tokyonight-storm", display_name = "Tokyo Night (Storm)" },
  { name = "tokyonight-day", display_name = "Tokyo Night (Day)" },
  { name = "tokyonight-moon", display_name = "Tokyo Night (Moon)" },
  
  -- Nightfox variants
  { name = "nightfox", display_name = "Nightfox" },
  { name = "dayfox", display_name = "Dayfox (Light)" },
  { name = "dawnfox", display_name = "Dawnfox" },
  { name = "duskfox", display_name = "Duskfox" },
  { name = "nordfox", display_name = "Nordfox" },
  { name = "terafox", display_name = "Terafox" },
  { name = "carbonfox", display_name = "Carbonfox" },
  
  -- Rose Pine variants
  { name = "rose-pine", display_name = "Rose Pine" },
  { name = "rose-pine-main", display_name = "Rose Pine Main" },
  { name = "rose-pine-moon", display_name = "Rose Pine Moon" },
  { name = "rose-pine-dawn", display_name = "Rose Pine Dawn (Light)" },
  
  -- Gruvbox variants
  { name = "gruvbox", display_name = "Gruvbox" },
  { name = "gruvbox-material", display_name = "Gruvbox Material" },
  
  -- Other popular themes
  { name = "kanagawa", display_name = "Kanagawa" },
  { name = "kanagawa-wave", display_name = "Kanagawa Wave" },
  { name = "kanagawa-dragon", display_name = "Kanagawa Dragon" },
  { name = "kanagawa-lotus", display_name = "Kanagawa Lotus (Light)" },
  { name = "everforest", display_name = "Everforest" },
  { name = "sonokai", display_name = "Sonokai" },
  { name = "edge", display_name = "Edge" },
  { name = "dracula", display_name = "Dracula" },
  { name = "github_dark", display_name = "GitHub Dark" },
  { name = "github_light", display_name = "GitHub Light" },
  { name = "github_dark_dimmed", display_name = "GitHub Dark Dimmed" },
  { name = "material", display_name = "Material" },
  { name = "material-darker", display_name = "Material Darker" },
  { name = "material-lighter", display_name = "Material Lighter" },
  { name = "material-oceanic", display_name = "Material Oceanic" },
  { name = "material-palenight", display_name = "Material Palenight" },
  { name = "material-deep-ocean", display_name = "Material Deep Ocean" },
  { name = "onedark", display_name = "One Dark" },
  { name = "onelight", display_name = "One Light" },
  { name = "onedark_pro", display_name = "One Dark Pro" },
  { name = "onelight_pro", display_name = "One Light Pro" },
  { name = "vscode", display_name = "VS Code Dark" },
  { name = "vscode_light", display_name = "VS Code Light" },
  { name = "nord", display_name = "Nord" },
  { name = "onenord", display_name = "One Nord" },
  { name = "nordic", display_name = "Nordic" },
  { name = "ayu", display_name = "Ayu" },
  { name = "ayu-light", display_name = "Ayu Light" },
  { name = "ayu-mirage", display_name = "Ayu Mirage" },
  { name = "nightfly", display_name = "Nightfly" },
  { name = "moonfly", display_name = "Moonfly" },
  { name = "tokyodark", display_name = "Tokyo Dark" },
  { name = "adwaita", display_name = "Adwaita" },
  { name = "poimandres", display_name = "Poimandres" },
  { name = "everblush", display_name = "Everblush" },
  { name = "rasmus", display_name = "Rasmus" },
  
  -- Built-in themes
  { name = "default", display_name = "Default" },
  { name = "blue", display_name = "Blue" },
  { name = "darkblue", display_name = "Dark Blue" },
  { name = "delek", display_name = "Delek" },
  { name = "desert", display_name = "Desert" },
  { name = "elflord", display_name = "Elflord" },
  { name = "evening", display_name = "Evening" },
  { name = "habamax", display_name = "Habamax" },
  { name = "industry", display_name = "Industry" },
  { name = "koehler", display_name = "Koehler" },
  { name = "lunaperche", display_name = "Lunaperche" },
  { name = "morning", display_name = "Morning" },
  { name = "murphy", display_name = "Murphy" },
  { name = "pablo", display_name = "Pablo" },
  { name = "peachpuff", display_name = "Peachpuff" },
  { name = "quiet", display_name = "Quiet" },
  { name = "ron", display_name = "Ron" },
  { name = "shine", display_name = "Shine" },
  { name = "slate", display_name = "Slate" },
  { name = "torte", display_name = "Torte" },
  { name = "zellner", display_name = "Zellner" },
}

-- Configurações específicas para cada tema
M.theme_configs = {
  ["catppuccin"] = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = false,
      integrations = {
        cmp = true,
        telescope = true,
        which_key = true,
        treesitter = true,
        mason = true,
        nvimtree = true,
      },
    })
  end,
  
  ["catppuccin-latte"] = function()
    require("catppuccin").setup({
      flavour = "latte",
      transparent_background = false,
      integrations = {
        cmp = true,
        telescope = true,
        which_key = true,
        treesitter = true,
        mason = true,
        nvimtree = true,
      },
    })
    vim.cmd.colorscheme("catppuccin-latte")
  end,
  
  ["catppuccin-frappe"] = function()
    require("catppuccin").setup({ flavour = "frappe" })
    vim.cmd.colorscheme("catppuccin-frappe")
  end,
  
  ["catppuccin-macchiato"] = function()
    require("catppuccin").setup({ flavour = "macchiato" })
    vim.cmd.colorscheme("catppuccin-macchiato")
  end,
  
  ["tokyonight"] = function()
    require("tokyonight").setup({
      style = "night",
      transparent = false,
      terminal_colors = true,
    })
  end,
  
  ["tokyonight-storm"] = function()
    require("tokyonight").setup({ style = "storm" })
    vim.cmd.colorscheme("tokyonight-storm")
  end,
  
  ["tokyonight-day"] = function()
    require("tokyonight").setup({ style = "day" })
    vim.cmd.colorscheme("tokyonight-day")
  end,
  
  ["tokyonight-moon"] = function()
    require("tokyonight").setup({ style = "moon" })
    vim.cmd.colorscheme("tokyonight-moon")
  end,
  
  ["gruvbox"] = function()
    require("gruvbox").setup({
      terminal_colors = true,
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true,
      contrast = "",
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
      transparent_mode = false,
    })
  end,
  
  ["rose-pine"] = function()
    require("rose-pine").setup({
      variant = "auto",
      dark_variant = "main",
      bold_vert_split = false,
      dim_nc_background = false,
      disable_background = false,
      disable_float_background = false,
    })
  end,
  
  ["kanagawa"] = function()
    require("kanagawa").setup({
      compile = false,
      undercurl = true,
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true},
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false,
      dimInactive = false,
      terminalColors = true,
    })
  end,
  
  ["material"] = function()
    require("material").setup({
      contrast = {
        terminal = false,
        sidebars = false,
        floating_windows = false,
        cursor_line = false,
        non_current_windows = false,
        filetypes = {},
      },
      styles = {
        comments = { italic = true },
        strings = { italic = false },
        keywords = { italic = false },
        functions = { bold = false },
        variables = {},
        operators = {},
        types = {},
      },
      plugins = {
        "nvim-cmp",
        "nvim-tree",
        "telescope",
        "which-key",
      },
      disable = {
        colored_cursor = false,
        borders = false,
        background = false,
        term_colors = false,
        eob_lines = false,
      },
      high_visibility = {
        lighter = false,
        darker = false,
      },
      lualine_style = "default",
      async_loading = true,
    })
  end,
  
  ["onedark"] = function()
    require("onedark").setup({
      style = "dark",
      transparent = false,
      term_colors = true,
      ending_tildes = false,
      cmp_itemkind_reverse = false,
      code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
      },
      lualine = {
        transparent = false,
      },
    })
  end,
}

-- Função para aplicar um tema
function M.apply_theme(theme_name)
  -- Primeiro, tenta aplicar configuração específica se existir
  if M.theme_configs[theme_name] then
    local ok, err = pcall(M.theme_configs[theme_name])
    if not ok then
      vim.notify("Error configuring theme " .. theme_name .. ": " .. err, vim.log.levels.ERROR)
      return false
    end
  end
  
  -- Aplica o tema
  local ok, err = pcall(vim.cmd.colorscheme, theme_name)
  if ok then
    vim.notify("Applied theme: " .. theme_name, vim.log.levels.INFO)
    
    -- Salva o tema atual em uma variável global para persistência
    vim.g.current_theme = theme_name
    
    -- Salva em um arquivo para persistir entre sessões
    local config_file = vim.fn.stdpath("config") .. "/current_theme.txt"
    local file = io.open(config_file, "w")
    if file then
      file:write(theme_name)
      file:close()
    end
    
    return true
  else
    vim.notify("Failed to apply theme " .. theme_name .. ": " .. err, vim.log.levels.ERROR)
    return false
  end
end

-- Função para carregar o último tema usado
function M.load_saved_theme()
  local config_file = vim.fn.stdpath("config") .. "/current_theme.txt"
  local file = io.open(config_file, "r")
  if file then
    local theme = file:read("*line")
    file:close()
    if theme and theme ~= "" then
      M.apply_theme(theme)
    end
  end
end

-- Função para tema aleatório
function M.random_theme()
  local random_index = math.random(1, #M.themes)
  local theme = M.themes[random_index]
  M.apply_theme(theme.name)
end

-- Função para próximo tema
function M.next_theme()
  local current = vim.g.current_theme or "catppuccin"
  local current_index = 1
  
  for i, theme in ipairs(M.themes) do
    if theme.name == current then
      current_index = i
      break
    end
  end
  
  local next_index = current_index + 1
  if next_index > #M.themes then
    next_index = 1
  end
  
  M.apply_theme(M.themes[next_index].name)
end

-- Função para tema anterior
function M.prev_theme()
  local current = vim.g.current_theme or "catppuccin"
  local current_index = 1
  
  for i, theme in ipairs(M.themes) do
    if theme.name == current then
      current_index = i
      break
    end
  end
  
  local prev_index = current_index - 1
  if prev_index < 1 then
    prev_index = #M.themes
  end
  
  M.apply_theme(M.themes[prev_index].name)
end

return M
