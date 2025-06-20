return {
  -- UI and Navigation
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  
  -- Themes Collection
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        transparent_background = false,
        integrations = {
          cmp = true,
          telescope = true,
          which_key = true,
          treesitter = true,
          mason = true,
          nvimtree = true,
          indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
          },
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  
  -- Additional Themes
  { "folke/tokyonight.nvim", lazy = true },
  { "EdenEast/nightfox.nvim", lazy = true },
  { "rose-pine/neovim", name = "rose-pine", lazy = true },
  { "ellisonleao/gruvbox.nvim", lazy = true },
  { "rebelot/kanagawa.nvim", lazy = true },
  { "sainnhe/everforest", lazy = true },
  { "sainnhe/gruvbox-material", lazy = true },
  { "sainnhe/sonokai", lazy = true },
  { "sainnhe/edge", lazy = true },
  { "Mofiqul/dracula.nvim", lazy = true },
  { "projekt0n/github-nvim-theme", lazy = true },
  { "marko-cerovac/material.nvim", lazy = true },
  { "olimorris/onedarkpro.nvim", lazy = true },
  { "navarasu/onedark.nvim", lazy = true },
  { "Mofiqul/vscode.nvim", lazy = true },
  { "shaunsingh/nord.nvim", lazy = true },
  { "rmehri01/onenord.nvim", lazy = true },
  { "AlexvZyl/nordic.nvim", lazy = true },
  { "Shatur/neovim-ayu", lazy = true },
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = true },
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = true },
  { "tiagovla/tokyodark.nvim", lazy = true },
  { "Mofiqul/adwaita.nvim", lazy = true },
  { "olivercederborg/poimandres.nvim", lazy = true },
  { "Everblush/nvim", name = "everblush", lazy = true },
  { "kvrohit/rasmus.nvim", lazy = true },
  
  -- Syntax Highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-context",
    },
  },
  
  -- Telescope
  { 
    "nvim-telescope/telescope.nvim", 
    dependencies = { 
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    event = "VeryLazy",
  },
  
  -- Comment
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  },
  
  -- Completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lua", -- Neovim Lua API completion
      "hrsh7th/cmp-emoji", -- Emoji completion
      "saadparwaiz1/cmp_luasnip",
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = {
          "rafamadriz/friendly-snippets",
        },
      },
      "onsails/lspkind.nvim", -- VS Code-like pictograms
    },
  },
  
  -- LSP
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-lspconfig.nvim" },
  },
  
  -- Formatting and Linting (Modern replacement for null-ls)
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
  },
  
  -- Schema store for JSON/YAML
  {
    "b0o/schemastore.nvim",
    lazy = true,
  },
  
  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = { "hrsh7th/nvim-cmp" },
  },
  
  -- Surround
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
  },
  
  -- File Explorer
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  
  -- AI Assistance
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
  },
  
  -- Icons
  { 
    "nvim-tree/nvim-web-devicons", 
    lazy = true 
  },
  { 
    "echasnovski/mini.icons", 
    version = false 
  },
}
