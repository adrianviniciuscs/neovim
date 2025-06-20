-- ~/.config/nvim/lua/adrian/keymaps.lua

-- General keymaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open Explorer" })

-- File Explorer Toggle (nvim-tree)
vim.keymap.set("n", "\\", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle File Explorer" })

-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Keep cursor in place
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })

-- Better search
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result" })

-- Paste without yanking
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })

-- System clipboard
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank line to system clipboard" })

-- Delete without yanking
vim.keymap.set("n", "<leader>d", '"_d', { desc = "Delete without yanking" })
vim.keymap.set("v", "<leader>d", '"_d', { desc = "Delete without yanking" })

-- Escape terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Escape terminal mode" })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize windows
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Clear search highlighting
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

-- Better indenting
vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Which-key general mappings
local ok, wk = pcall(require, "which-key")
if ok then
  wk.add({
    { "<leader>w", group = "Window" },
    { "<leader>wh", "<C-w>h", desc = "Go to left window" },
    { "<leader>wj", "<C-w>j", desc = "Go to lower window" },
    { "<leader>wk", "<C-w>k", desc = "Go to upper window" },
    { "<leader>wl", "<C-w>l", desc = "Go to right window" },
  { "<leader>ws", "<cmd>split<cr>", desc = "Split window horizontally" },
  { "<leader>wv", "<cmd>vsplit<cr>", desc = "Split window vertically" },
  { "<leader>wc", "<cmd>close<cr>", desc = "Close window" },
  { "<leader>wo", "<cmd>only<cr>", desc = "Close other windows" },
  
  { "<leader>b", group = "Buffer" },
  { "<leader>bd", "<cmd>bdelete<cr>", desc = "Delete buffer" },
  { "<leader>bn", "<cmd>bnext<cr>", desc = "Next buffer" },
  { "<leader>bp", "<cmd>bprevious<cr>", desc = "Previous buffer" },
  { "<leader>bl", "<cmd>blast<cr>", desc = "Last buffer" },
  { "<leader>bf", "<cmd>bfirst<cr>", desc = "First buffer" },
  
    { "<leader>q", group = "Quit" },
    { "<leader>qq", "<cmd>qa<cr>", desc = "Quit all" },
    { "<leader>qw", "<cmd>wqa<cr>", desc = "Save and quit all" },
    { "<leader>qx", "<cmd>xa<cr>", desc = "Save and quit all" },
  })
end
