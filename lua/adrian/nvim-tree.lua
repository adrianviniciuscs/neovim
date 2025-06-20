-- ~/.config/nvim/lua/adrian/nvim-tree.lua

-- Disable netrw (built-in file explorer)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Setup nvim-tree
require("nvim-tree").setup({
  -- General settings
  auto_reload_on_write = true,
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = false,
  hijack_unnamed_buffer_when_opening = false,
  sort_by = "name",
  root_dirs = {},
  prefer_startup_root = false,
  sync_root_with_cwd = true,
  reload_on_bufenter = false,
  respect_buf_cwd = false,
  
  -- View settings
  view = {
    adaptive_size = false,
    centralize_selection = false,
    width = 35,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    float = {
      enable = false,
      quit_on_focus_loss = true,
      open_win_config = {
        relative = "editor",
        border = "rounded",
        width = 30,
        height = 30,
        row = 1,
        col = 1,
      },
    },
  },
  
  -- Renderer settings
  renderer = {
    add_trailing = false,
    group_empty = false,
    highlight_git = true,
    full_name = false,
    highlight_opened_files = "name",
    root_folder_label = ":~:s?$?/..?",
    indent_width = 2,
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "package.json" },
    symlink_destination = true,
  },
  
  -- Hijack directories
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  
  -- Update focus
  update_focused_file = {
    enable = true,
    update_root = false,
    ignore_list = {},
  },
  
  -- System open
  system_open = {
    cmd = "",
    args = {},
  },
  
  -- Diagnostics
  diagnostics = {
    enable = false, -- Disable diagnostics to avoid sign errors
  },
  
  -- Filters
  filters = {
    dotfiles = false,
    git_clean = false,
    no_buffer = false,
    custom = {},
    exclude = {},
  },
  
  -- Filesystem watchers
  filesystem_watchers = {
    enable = true,
    debounce_delay = 50,
    ignore_dirs = {},
  },
  
  -- Git integration
  git = {
    enable = true,
    ignore = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
    timeout = 400,
  },
  
  -- Actions
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    expand_all = {
      max_folder_discovery = 300,
      exclude = {},
    },
    file_popup = {
      open_win_config = {
        col = 1,
        row = 1,
        relative = "cursor",
        border = "shadow",
        style = "minimal",
      },
    },
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = true,
        picker = "default",
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
    remove_file = {
      close_window = true,
    },
  },
  
  -- Trash
  trash = {
    cmd = "gio trash",
    require_confirm = true,
  },
  
  -- Live filter
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = true,
  },
  
  -- Tab
  tab = {
    sync = {
      open = false,
      close = false,
      ignore = {},
    },
  },
  
  -- Notifications
  notify = {
    threshold = vim.log.levels.INFO,
  },
  
  -- Logs
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      dev = false,
      diagnostics = false,
      git = false,
      profile = false,
      watcher = false,
    },
  },
})

-- Key mappings (main toggle is in keymaps.lua as '\')
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<cr>", { desc = "Focus File Explorer" })
vim.keymap.set("n", "<leader>E", "<cmd>NvimTreeFindFile<cr>", { desc = "Find Current File in Explorer" })

-- Which-key mappings
local ok, wk = pcall(require, "which-key")
if ok then
  wk.add({
    { "<leader>e", group = "Explorer" },
    { "<leader>ee", "<cmd>NvimTreeToggle<cr>", desc = "Toggle Explorer" },
    { "<leader>ef", "<cmd>NvimTreeFindFile<cr>", desc = "Find Current File" },
    { "<leader>er", "<cmd>NvimTreeRefresh<cr>", desc = "Refresh Explorer" },
    { "<leader>ec", "<cmd>NvimTreeCollapse<cr>", desc = "Collapse All" },
  })
end

-- Auto commands
local function open_nvim_tree()
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- Close nvim-tree if it's the last window
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})
