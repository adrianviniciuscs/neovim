-- ~/.config/nvim/lua/adrian/plugins.lua

return {
  plugins = {
    -- --- Gerenciamento de Plugins ---
    {
      'folke/lazy.nvim',
      version = 'auto',
    },

    -- --- UI / Essenciais ---
    {
      'nvim-telescope/telescope.nvim', tag = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' },
    },
    {
      'folke/which-key.nvim',
      event = 'VimEnter',
    },
    {
        'nvim-tree/nvim-tree.lua',
        version = '*',
        lazy = false,
        dependencies = {
            'nvim-tree/nvim-web-devicons', -- Required for file icons
        },
        config = function()
            require('nvim-tree').setup {}
        end
    },
    {
        'numToStr/Comment.nvim',
        dependencies = {
            'JoosepAlviste/nvim-ts-context-commentstring', -- Opcional, melhora o auto-comentário
        },
        config = function()
            require('Comment').setup({
                -- Configurações padrão, você pode personalizar aqui
                -- Ex: ignore_empty = true para não comentar linhas vazias
            })
        end
    },

    -- --- Autocompletar ---
    {
      'hrsh7th/nvim-cmp',
      event = 'InsertEnter',
      dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'saadparwaiz1/cmp_luasnip',
        'L3MON4D3/LuaSnip',
      },
    },

    -- --- LSP ---
    {
      'neovim/nvim-lspconfig',
      dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'hrsh7th/cmp-nvim-lsp',
        -- Para melhor integração do LSP com C/C++
        'jose-elias-alvarez/null-ls.nvim', -- Para formatadores e linters adicionais
        'nvim-lua/plenary.nvim',          -- Dependência de outros plugins
      },
      },
    -- --- Tree-sitter (Sintaxe avançada) ---
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = { "c", "cpp", "python", "lua", "javascript", "typescript", "html", "css", "json", "bash" },
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true,
                },
            })
        end
    },

    -- --- Copilot ---
    {
      'zbirenbaum/copilot.lua',
      event = 'InsertEnter',
    },

    -- --- Tema (Opcional, mas melhora o visual) ---
    { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  }
}
