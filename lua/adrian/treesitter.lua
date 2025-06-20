-- ~/.config/nvim/lua/adrian/treesitter.lua

require("nvim-treesitter.configs").setup({
  -- Instalar parsers automaticamente
  ensure_installed = {
    "c", "cpp", "lua", "vim", "vimdoc", "query",
    "javascript", "typescript", "python", "rust",
    "go", "bash", "json", "yaml", "toml", "html",
    "css", "scss", "markdown", "markdown_inline",
    "regex", "dockerfile", "gitignore"
  },
  
  -- Instalar parsers de forma síncrona (apenas aplicado aos parsers `ensure_installed`)
  sync_install = false,
  
  -- Instalar parsers automaticamente (para `ensure_installed`)
  auto_install = true,
  
  -- Lista de parsers para ignorar na instalação (ou "all")
  ignore_install = {},
  
  ---- Se você precisar alterar o diretório de instalação dos parsers (veja -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Lembre-se de executar vim.opt.runtimepath:append("/some/path/to/store/parsers")!
  
  highlight = {
    enable = true,
    
    -- NOTE: estas são as extensões que serão desabilitadas.
    -- Remova a linguagem para habilitar o highlight para ela:
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
    
    -- Definir isso como true irá executar `:h syntax` e tree-sitter ao mesmo tempo.
    -- Definir isso como true irá retardar a edição em alguns casos.
    -- Você pode usar a função enable para definir em quais linguagens usar vim syntax.
    additional_vim_regex_highlighting = false,
  },
  
  indent = {
    enable = true,
  },
  
  -- Seleção incremental
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-space>",
      node_incremental = "<C-space>",
      scope_incremental = "<C-s>",
      node_decremental = "<M-space>",
    },
  },
  
  -- Text objects
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- Você pode usar os capture groups definidos em textobjects.scm
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- se você deseja definir jumps na jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
  },
})

-- Treesitter context
require("treesitter-context").setup({
  enable = true,
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 20, -- Maximum number of lines to show for a single context
  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = nil,
  zindex = 20, -- The Z-index of the context window
  on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
})

-- Which-key mappings for Treesitter
local ok, wk = pcall(require, "which-key")
if ok then
  wk.add({
    { "<leader>T", group = "Treesitter" },
    { "<leader>Th", "<cmd>TSToggle highlight<cr>", desc = "Toggle Highlight" },
    { "<leader>Ti", "<cmd>TSToggle indent<cr>", desc = "Toggle Indent" },
    { "<leader>Tc", "<cmd>TSContextToggle<cr>", desc = "Toggle Context" },
    { "<leader>TI", "<cmd>TSInstallInfo<cr>", desc = "Install Info" },
    { "<leader>Tu", "<cmd>TSUpdate<cr>", desc = "Update Parsers" },
  })
end
