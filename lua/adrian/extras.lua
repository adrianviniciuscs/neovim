-- ~/.config/nvim/lua/adrian/extras.lua

-- Better defaults
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.cursorline = true
vim.opt.colorcolumn = "80"
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = "↪ "

-- Undo settings
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Split settings
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Completion settings
vim.opt.completeopt = "menuone,noselect,noinsert"
vim.opt.shortmess:append("c")

-- Performance
vim.opt.lazyredraw = true
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 0

-- Mouse support
vim.opt.mouse = "a"

-- Better backup/swap/undo
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Show invisible characters
vim.opt.list = true
vim.opt.listchars = {
  tab = "→ ",
  eol = "↲",
  nbsp = "␣",
  trail = "•",
  extends = "⟩",
  precedes = "⟨",
}

-- Folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false -- Start with folds open

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- Auto-resize splits when window is resized
vim.api.nvim_create_autocmd("VimResized", {
  group = vim.api.nvim_create_augroup("WinResize", { clear = true }),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("TrimWhitespace", { clear = true }),
  callback = function()
    -- Only trim whitespace for certain file types
    local ft = vim.bo.filetype
    local skip_fts = { "diff", "gitcommit", "gitrebase" }
    
    if not vim.tbl_contains(skip_fts, ft) then
      local save_cursor = vim.fn.getpos(".")
      pcall(function()
        vim.cmd([[%s/\s\+$//e]])
      end)
      vim.fn.setpos(".", save_cursor)
    end
  end,
})

-- Better terminal experience
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("TerminalSettings", { clear = true }),
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
    vim.opt_local.foldcolumn = "0"
    vim.cmd("startinsert")
  end,
})

-- File type specific settings
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("FileTypeSettings", { clear = true }),
  pattern = { "markdown", "text" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.colorcolumn = "100"
  end,
})

-- LSP progress indicator
local function lsp_progress()
  local messages = vim.lsp.util.get_progress_messages()
  if #messages == 0 then
    return ""
  end
  local status = {}
  for _, msg in pairs(messages) do
    table.insert(status, (msg.percentage or 0) .. "%% " .. (msg.title or ""))
  end
  return table.concat(status, " | ")
end

-- Simple statusline
vim.opt.statusline = "%f %h%m%r%=%-14.(%l,%c%V%) %P"



