-- ~/.config/nvim/lua/adrian/telescope.lua

local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")

-- Telescope keymaps
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find by Grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Find Recent Files" })
vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find Word under Cursor" })
vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Find Commands" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find Keymaps" })
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Find Symbols" })
vim.keymap.set("n", "<leader>fS", builtin.lsp_workspace_symbols, { desc = "Find Workspace Symbols" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Find Diagnostics" })
vim.keymap.set("n", "<leader>fT", builtin.treesitter, { desc = "Find Treesitter" })

-- Theme picker
vim.keymap.set("n", "<leader>ft", function()
  require("adrian.theme-picker").pick_theme()
end, { desc = "Theme Picker" })

-- Git telescope
vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Git Commits" })
vim.keymap.set("n", "<leader>gC", builtin.git_bcommits, { desc = "Git Buffer Commits" })
vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Git Branches" })
vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Git Status" })

-- Which-key mappings
local ok, wk = pcall(require, "which-key")
if ok then
  wk.add({
    { "<leader>f", group = "Find" },
    { "<leader>g", group = "Git" },
    { "<leader>t", group = "Themes" },
  })
end

-- Telescope setup
require("telescope").setup({
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "truncate" },
    file_ignore_patterns = { 
      "node_modules", 
      ".git/", 
      "*.pyc", 
      "__pycache__/",
      "*.o",
      "*.so",
      "*.dylib",
    },
    
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        ["<C-h>"] = "which_key",
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
        ["<M-p>"] = action_layout.toggle_preview,
        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<M-p>"] = action_layout.toggle_preview,
        ["q"] = actions.close,
      },
    },
    
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    
    sorting_strategy = "ascending",
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    use_less = true,
    set_env = { ["COLORTERM"] = "truecolor" },
  },
  
  pickers = {
    -- Default configuration for builtin pickers goes here:
    find_files = {
      theme = "dropdown",
      previewer = false,
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
    },
    live_grep = {
      additional_args = function(opts)
        return {"--hidden"}
      end
    },
    buffers = {
      theme = "dropdown",
      previewer = false,
      initial_mode = "normal",
      mappings = {
        i = {
          ["<C-d>"] = actions.delete_buffer,
        },
        n = {
          ["dd"] = actions.delete_buffer,
        },
      },
    },
    oldfiles = {
      theme = "dropdown",
      previewer = false,
    },
    help_tags = {
      theme = "ivy",
    },
  },
  
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  }
})

-- Load telescope extensions
require("telescope").load_extension("fzf")

-- Custom telescope functions
local M = {}

-- Search in dotfiles
M.search_dotfiles = function()
  builtin.find_files({
    prompt_title = "< VimRC >",
    cwd = vim.env.HOME .. "/.config/nvim",
    hidden = true,
  })
end

-- Search in current buffer directory
M.find_files_current_buffer = function()
  builtin.find_files({
    prompt_title = "< Files in " .. vim.fn.expand("%:p:h:t") .. " >",
    cwd = vim.fn.expand("%:p:h"),
  })
end

-- Grep in current buffer directory
M.live_grep_current_buffer = function()
  builtin.live_grep({
    prompt_title = "< Grep in " .. vim.fn.expand("%:p:h:t") .. " >",
    cwd = vim.fn.expand("%:p:h"),
  })
end

-- Custom keymaps
vim.keymap.set("n", "<leader>fv", M.search_dotfiles, { desc = "Find Vim Config" })
vim.keymap.set("n", "<leader>f.", M.find_files_current_buffer, { desc = "Find Files in Current Dir" })
vim.keymap.set("n", "<leader>g.", M.live_grep_current_buffer, { desc = "Grep in Current Dir" })

return M
