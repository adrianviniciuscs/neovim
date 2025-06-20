-- ~/.config/nvim/lua/adrian/lsp.lua

local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

-- Mason setup
mason.setup({
  ui = {
    border = "rounded",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

mason_lspconfig.setup({
  ensure_installed = {
    "lua_ls",
    "clangd",
    "pyright",
    "gopls",
    "bashls",
    "jsonls",
    "yamlls",
    "html",
    "cssls",
    "tailwindcss",
  },
  automatic_installation = true,
})

-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    source = "if_many",
  },
  float = {
    source = "always",
    border = "rounded",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Diagnostic signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- LSP handlers
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})

-- Capabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- LSP keymaps
  local opts = { buffer = bufnr, silent = true }

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to Definition" })
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to Declaration" })
  vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "Go to References" })
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Go to Implementation" })
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = bufnr, desc = "Go to Type Definition" })
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover Documentation" })
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Signature Help" })
  vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Signature Help" })

  -- Diagnostics
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr, desc = "Previous Diagnostic" })
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = bufnr, desc = "Next Diagnostic" })
  vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { buffer = bufnr, desc = "Show Diagnostics" })
  vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { buffer = bufnr, desc = "Diagnostic List" })

  -- Code actions
  vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code Action" })
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename Symbol" })

  -- Workspace
  vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { buffer = bufnr, desc = "Add Workspace Folder" })
  vim.keymap.set(
    "n",
    "<leader>wr",
    vim.lsp.buf.remove_workspace_folder,
    { buffer = bufnr, desc = "Remove Workspace Folder" }
  )
  vim.keymap.set("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { buffer = bufnr, desc = "List Workspace Folders" })

  -- Which-key LSP mappings
  local ok, wk = pcall(require, "which-key")
  if ok then
    wk.add({
      { "<leader>l", group = "LSP", buffer = bufnr },
      { "<leader>lr", vim.lsp.buf.rename, desc = "Rename", buffer = bufnr },
      { "<leader>la", vim.lsp.buf.code_action, desc = "Code Action", buffer = bufnr },
      { "<leader>ld", vim.diagnostic.open_float, desc = "Show Diagnostics", buffer = bufnr },
      {
        "<leader>lf",
        function()
          require("conform").format({ lsp_fallback = true })
        end,
        desc = "Format Document",
        buffer = bufnr,
      },
      { "<leader>li", "<cmd>LspInfo<cr>", desc = "LSP Info", buffer = bufnr },
      { "<leader>lR", "<cmd>LspRestart<cr>", desc = "Restart LSP", buffer = bufnr },
      { "<leader>ls", "<cmd>LspStart<cr>", desc = "Start LSP", buffer = bufnr },
      { "<leader>lS", "<cmd>LspStop<cr>", desc = "Stop LSP", buffer = bufnr },

      { "<leader>w", group = "Workspace", buffer = bufnr },
      { "<leader>wa", vim.lsp.buf.add_workspace_folder, desc = "Add Folder", buffer = bufnr },
      { "<leader>wr", vim.lsp.buf.remove_workspace_folder, desc = "Remove Folder", buffer = bufnr },
      {
        "<leader>wl",
        function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end,
        desc = "List Folders",
        buffer = bufnr,
      },
    })
  end

  -- Highlight symbol under cursor
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_augroup("lsp_document_highlight", {
      clear = false,
    })
    vim.api.nvim_clear_autocmds({
      buffer = bufnr,
      group = "lsp_document_highlight",
    })
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      group = "lsp_document_highlight",
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
      group = "lsp_document_highlight",
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

-- Server configurations
local servers = {
  lua_ls = {
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
        },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        telemetry = {
          enable = false,
        },
        format = {
          enable = false,
        },
      },
    },
  },

  clangd = {
    cmd = {
      "clangd",
      "--background-index",
      "--clang-tidy",
      "--header-insertion=iwyu",
      "--completion-style=detailed",
      "--function-arg-placeholders",
      "--fallback-style=llvm",
    },
    init_options = {
      usePlaceholders = true,
      completeUnimported = true,
      clangdFileStatus = true,
    },
  },

  pyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true,
        },
      },
    },
  },

  tsserver = {
    settings = {
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
      javascript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    },
  },
}

-- Setup servers
mason_lspconfig.setup({
  ensure_installed = {
    "lua_ls",
    "clangd",
    "pyright",
    "tsserver",
    "rust_analyzer",
    "gopls",
    "html",
    "cssls",
    "jsonls",
    "yamlls",
    "bashls",
  },
  handlers = {
    function(server_name)
      local server_config = servers[server_name] or {}
      server_config.on_attach = on_attach
      server_config.capabilities = capabilities
      lspconfig[server_name].setup(server_config)
    end,
  },
})
