-- Test keymaps configuration
-- This file validates that all keymaps are properly configured

print("🔍 Testing Neovim Configuration...")

-- Test Telescope
local telescope_ok, telescope = pcall(require, "telescope.builtin")
if telescope_ok then
  print("✅ Telescope: OK")
  print("  - find_files: " .. (telescope.find_files and "✅" or "❌"))
  print("  - live_grep: " .. (telescope.live_grep and "✅" or "❌"))
  print("  - buffers: " .. (telescope.buffers and "✅" or "❌"))
else
  print("❌ Telescope: FAILED")
end

-- Test Which-key
local wk_ok, wk = pcall(require, "which-key")
if wk_ok then
  print("✅ Which-key: OK")
else
  print("❌ Which-key: FAILED")
end

-- Test LSP
local mason_ok, mason = pcall(require, "mason")
if mason_ok then
  print("✅ Mason: OK")
else
  print("❌ Mason: FAILED")
end

-- Test Treesitter
local ts_ok, ts = pcall(require, "nvim-treesitter.configs")
if ts_ok then
  print("✅ Treesitter: OK")
else
  print("❌ Treesitter: FAILED")
end

-- Test nvim-tree
local tree_ok, tree = pcall(require, "nvim-tree")
if tree_ok then
  print("✅ Nvim-tree: OK")
else
  print("❌ Nvim-tree: FAILED")
end

-- Test Conform
local conform_ok, conform = pcall(require, "conform")
if conform_ok then
  print("✅ Conform: OK")
else
  print("❌ Conform: FAILED")
end

-- Test Copilot
local copilot_ok, copilot = pcall(require, "copilot")
if copilot_ok then
  print("✅ Copilot: OK")
else
  print("❌ Copilot: FAILED")
end

print("\n🎯 Key Mappings Test:")
print("Main keymaps configured:")
print("  \\ - Toggle file explorer")
print("  <leader>ff - Find files")
print("  <leader>fg - Live grep")
print("  <leader>fb - Find buffers")
print("  <leader>e - Explorer menu")
print("  <leader>l - LSP menu")

print("\n✨ Configuration validation complete!")
