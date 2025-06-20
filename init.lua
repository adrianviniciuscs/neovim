-- ~/.config/nvim/init.lua

-- Configurações básicas do Neovim
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.updatetime = 300
vim.opt.signcolumn = "yes"
vim.opt.conceallevel = 0

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Carrega plugins e configurações
require("lazy").setup(require("adrian.plugins"))
require("adrian") -- <- aqui carrega init.lua da pasta "adrian"
