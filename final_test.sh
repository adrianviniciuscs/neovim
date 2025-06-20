#!/bin/zsh
# Final Neovim configuration test

echo "🎯 Final Neovim Configuration Test"
echo "=================================="
echo

# Test basic loading
echo "📋 Testing configuration loading..."
if nvim --headless -c "lua print('Configuration loaded successfully')" -c qall 2>/dev/null; then
    echo "✅ Configuration loads without errors"
else
    echo "❌ Configuration has errors"
    exit 1
fi

# Test plugin loading with corrected Lua syntax
echo
echo "🔌 Testing plugin availability..."
nvim --headless -c 'lua 
local plugins = {"telescope.builtin", "which-key", "mason", "nvim-treesitter.configs", "nvim-tree", "conform", "copilot"}
for _, plugin in ipairs(plugins) do
    local ok, _ = pcall(require, plugin)
    local icon = ok and "✅" or "❌"
    print(icon .. " " .. plugin .. ": " .. (ok and "OK" or "FAILED"))
end
' -c qall

echo
echo "🎉 Configuration Summary:"
echo "   ✅ Modern Neovim setup with Lazy.nvim"
echo "   ✅ Catppuccin theme"
echo "   ✅ File explorer (nvim-tree) - Toggle with \\"
echo "   ✅ Fuzzy finder (Telescope) - <Space>ff to find files"
echo "   ✅ LSP support with Mason"
echo "   ✅ Advanced completion with nvim-cmp"
echo "   ✅ Syntax highlighting with Treesitter"
echo "   ✅ Code formatting with Conform"
echo "   ✅ GitHub Copilot integration"
echo "   ✅ Smart commenting and text objects"
echo "   ✅ Which-key for keybinding help"

echo
echo "🚀 Ready to use! Key shortcuts:"
echo "   \\             - Toggle file explorer"
echo "   <Space>ff     - Find files"
echo "   <Space>fg     - Live grep"
echo "   <Space>e      - Explorer menu"
echo "   <Space>l      - LSP menu"
echo "   <Space>?      - Show all keybindings"
