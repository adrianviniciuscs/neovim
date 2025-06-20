-- ~/.config/nvim/init.lua

-- Configurações básicas do Neovim
vim.opt.nu = true                -- Mostrar número das linhas
vim.opt.relativenumber = true    -- Mostrar número relativo das linhas
vim.opt.tabstop = 4              -- 4 espaços para tab
vim.opt.shiftwidth = 4           -- 4 espaços para indentação
vim.opt.expandtab = true         -- Usar espaços em vez de tabs
vim.opt.smartindent = true       -- Indentação inteligente
vim.opt.hlsearch = true          -- Destacar resultados de busca
vim.opt.incsearch = true         -- Busca incremental
vim.opt.termguicolors = true     -- Habilita cores verdadeiras no terminal
vim.opt.updatetime = 300         -- Tempo para gravar swapfile
vim.opt.signcolumn = "yes"       -- Sempre mostrar coluna de sinais (LSP, etc)
vim.opt.conceallevel = 0         -- Não esconder texto (Markdown, etc)

-- Definir a tecla <leader> como espaço
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- --- Lazy.nvim setup ---
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({"git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath})
end
vim.opt.rtp:prepend(lazypath)

-- Carregar seus plugins e configurações
require("lazy").setup(require("adrian.plugins").plugins)

-- Carregar as configurações específicas dos plugins
require("adrian.config")