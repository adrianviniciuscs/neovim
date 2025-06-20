#!/bin/bash
# Test script to verify Neovim configuration

echo "Testing Neovim configuration..."

# Test basic functionality
nvim --headless -c "lua print('Basic test: OK')" -c qall

# Test telescope
nvim --headless -c "lua require('telescope.builtin'); print('Telescope: OK')" -c qall

# Test which-key
nvim --headless -c "lua require('which-key'); print('Which-key: OK')" -c qall

# Test LSP
nvim --headless -c "lua require('mason'); print('Mason: OK')" -c qall

echo "✅ All tests completed!"
