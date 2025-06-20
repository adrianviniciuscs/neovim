# Adrian's Neovim Configuration

A modern, feature-rich Neovim configuration with Treesitter syntax highlighting, LSP, completion, and productivity features.

## 🚀 Features

- **Plugin Manager**: Lazy.nvim with optimized loading
- **File Explorer**: nvim-tree with intuitive navigation
- **Syntax Highlighting**: Treesitter with multiple languages
- **LSP**: Comprehensive Language Server Protocol support with Mason
- **Completion**: Advanced nvim-cmp with multiple sources and snippets
- **Fuzzy Finding**: Telescope with fzf native support
- **Formatting**: Modern conform.nvim + nvim-lint (replaces null-ls)
- **AI Assistance**: GitHub Copilot integration
- **Comments**: Smart commenting with context awareness
- **Theme**: Beautiful Catppuccin colorscheme with proper integrations
- **Auto Pairs**: Intelligent bracket/quote pairing with nvim-autopairs
- **Surround**: Easy text surrounding operations
- **Key Mappings**: Organized keybindings with which-key
- **Quality of Life**: Better defaults, auto-commands, and workflow enhancements

## 📁 Structure

```
~/.config/nvim/
├── init.lua                 # Main configuration entry point
├── lazy-lock.json          # Plugin version lock file
├── README.md               # This file
└── lua/adrian/
    ├── init.lua            # Module loader
    ├── plugins.lua         # Plugin specifications
    ├── extras.lua          # Better defaults and QoL improvements
    ├── keymaps.lua         # General keymaps
    ├── nvim-tree.lua       # File explorer config
    ├── treesitter.lua      # Syntax highlighting config
    ├── lsp.lua             # LSP configuration
    ├── cmp.lua             # Advanced completion setup
    ├── autopairs.lua       # Auto pairs configuration
    ├── conform.lua         # Formatting configuration  
    ├── lint.lua            # Linting configuration
    ├── telescope.lua       # Enhanced fuzzy finder
    ├── comment.lua         # Smart commenting
    ├── surround.lua        # Text surrounding
    ├── copilot.lua         # AI assistance config
    └── theme.lua           # Theme and UI settings
```

## ⌨️ Key Mappings

### Leader Key: `<Space>`

#### File Explorer (nvim-tree)
- `\` - Toggle file explorer (main keymap)
- `<leader>e` - File explorer menu
- `<leader>ee` - Toggle explorer
- `<leader>ef` - Find current file in explorer
- `<leader>er` - Refresh explorer
- `<leader>ec` - Collapse all folders

**File Explorer Navigation:**
- `Enter` or `o` - Open file/folder
- `<Tab>` - Preview file
- `R` - Refresh
- `a` - Create file/folder
- `d` - Delete
- `r` - Rename
- `x` - Cut
- `c` - Copy
- `p` - Paste
- `y` - Copy name/path
- `gy` - Copy absolute path
- `I` - Toggle git ignored files
- `H` - Toggle hidden files

#### Find (Telescope)
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>fb` - Find buffers
- `<leader>fh` - Help tags
- `<leader>fr` - Recent files
- `<leader>fw` - Find word under cursor
- `<leader>fc` - Find commands
- `<leader>fk` - Find keymaps
- `<leader>fs` - Find symbols
- `<leader>fd` - Find diagnostics
- `<leader>fv` - Find Vim config
- `<leader>f.` - Find files in current directory
- `<leader>g.` - Grep in current directory

#### LSP
- `gd` - Go to definition
- `gD` - Go to declaration
- `gr` - Go to references
- `gi` - Go to implementation
- `gt` - Go to type definition
- `K` - Hover documentation
- `<C-k>` - Signature help
- `<leader>rn` - Rename symbol
- `<leader>ca` - Code action
- `<leader>d` - Show diagnostics
- `[d` / `]d` - Navigate diagnostics
- `<leader>lr` - Rename (which-key)
- `<leader>la` - Code action (which-key)
- `<leader>lf` - Format document
- `<leader>li` - LSP info

#### Treesitter
- `<C-space>` - Init selection
- `<C-space>` - Expand selection
- `<C-s>` - Scope incremental
- `<M-space>` - Shrink selection
- `]m` / `[m` - Next/previous function
- `]]` / `[[` - Next/previous class

#### Comment
- `<leader>cc` - Toggle line comment
- `<leader>cb` - Toggle block comment
- `gc` - Comment operator
- `gb` - Block comment operator
- `gcO` - Comment above
- `gco` - Comment below
- `gcA` - Comment end of line

#### Surround
- `ys{motion}{char}` - Add surround
- `yss{char}` - Add surround (line)
- `ds{char}` - Delete surround
- `cs{old}{new}` - Change surround

#### Copilot
- `<M-l>` - Accept suggestion
- `<M-w>` - Accept word
- `<M-j>` - Accept line
- `<M-]>` / `<M-[>` - Navigate suggestions
- `<leader>cp` - Copilot menu

#### Snippets
- `<Tab>` - Expand/jump forward
- `<S-Tab>` - Jump backward
- `<C-L>` - Jump forward
- `<C-H>` - Jump backward
- `<C-E>` - Change choice

#### Window Management
- `<leader>ws` - Split horizontally
- `<leader>wv` - Split vertically
- `<leader>wc` - Close window
- `<leader>wo` - Close other windows
- `<C-h/j/k/l>` - Navigate windows

#### Buffers
- `<leader>bd` - Delete buffer
- `<leader>bn` - Next buffer
- `<leader>bp` - Previous buffer

## 🛠️ Installation

1. Backup your existing Neovim configuration
2. Clone or copy this configuration to `~/.config/nvim/`
3. Start Neovim - plugins will install automatically
4. Run `:checkhealth` to verify everything is working
5. Run `:Mason` to install additional LSP servers/formatters

## 📦 Plugins Used

### Core
- **folke/lazy.nvim** - Plugin manager
- **folke/which-key.nvim** - Key binding helper

### UI & Theme
- **catppuccin/nvim** - Beautiful colorscheme
- **nvim-tree/nvim-tree.lua** - File explorer
- **nvim-tree/nvim-web-devicons** - File icons
- **echasnovski/mini.icons** - Additional icons

### Navigation & Search
- **nvim-telescope/telescope.nvim** - Fuzzy finder
- **nvim-telescope/telescope-fzf-native.nvim** - Native FZF integration

### Syntax & Language Support
- **nvim-treesitter/nvim-treesitter** - Syntax highlighting
- **nvim-treesitter/nvim-treesitter-textobjects** - Text objects
- **nvim-treesitter/nvim-treesitter-context** - Context display

### LSP & Completion
- **williamboman/mason.nvim** - LSP installer
- **williamboman/mason-lspconfig.nvim** - Mason-LSP bridge
- **neovim/nvim-lspconfig** - LSP configurations
- **hrsh7th/nvim-cmp** - Completion engine
- **hrsh7th/cmp-nvim-lsp** - LSP completion
- **hrsh7th/cmp-buffer** - Buffer completion
- **hrsh7th/cmp-path** - Path completion
- **hrsh7th/cmp-cmdline** - Command line completion
- **hrsh7th/cmp-nvim-lua** - Neovim Lua API
- **hrsh7th/cmp-emoji** - Emoji completion
- **onsails/lspkind.nvim** - VS Code-like pictograms

### Snippets
- **L3MON4D3/LuaSnip** - Snippet engine
- **saadparwaiz1/cmp_luasnip** - LuaSnip completion
- **rafamadriz/friendly-snippets** - Snippet collection

### Formatting & Linting
- **stevearc/conform.nvim** - Modern formatter
- **mfussenegger/nvim-lint** - Linter
- **b0o/schemastore.nvim** - JSON/YAML schemas

### Navigation
- **nvim-telescope/telescope.nvim** - Fuzzy finder
- **nvim-telescope/telescope-fzf-native.nvim** - FZF sorter
- **nvim-lua/plenary.nvim** - Utility functions

### Editing
- **numToStr/Comment.nvim** - Smart commenting
- **JoosepAlviste/nvim-ts-context-commentstring** - Context-aware comments
- **windwp/nvim-autopairs** - Auto pairs
- **kylechui/nvim-surround** - Text surrounding

### AI
- **zbirenbaum/copilot.lua** - GitHub Copilot

## 🔧 Customization

Each module is self-contained and easily customizable:

- **Plugins**: Edit `lua/adrian/plugins.lua`
- **Keymaps**: Modify `lua/adrian/keymaps.lua`
- **LSP**: Adjust `lua/adrian/lsp.lua`
- **Completion**: Configure `lua/adrian/cmp.lua`
- **Formatting**: Update `lua/adrian/conform.lua`
- **Syntax**: Customize `lua/adrian/treesitter.lua`
- **Theme**: Change `lua/adrian/theme.lua`

## 🆘 Troubleshooting

- Run `:checkhealth` to diagnose issues
- Use `:Lazy` to manage plugins
- Check `:Mason` for LSP server installations
- Use `:ConformInfo` for formatter status
- Use `:LspInfo` for LSP status
- Use `:TSInstallInfo` for Treesitter parsers
- Use `:WhichKey` to see available key mappings

## 🎯 Language Support

Pre-configured for:
- **Lua** (Neovim configuration)
- **C/C++** (clangd)
- **Python** (pyright)
- **JavaScript/TypeScript** (tsserver)
- **Rust** (rust-analyzer)
- **Go** (gopls)
- **Bash** (bashls)
- **JSON/YAML** (with schema validation)
- **HTML/CSS** (html, cssls)
- **And many more...**

## ⚡ Performance

- Lazy loading for fast startup
- Treesitter for efficient syntax highlighting  
- Mason for automatic tool management
- Optimized keymaps and plugin configurations
