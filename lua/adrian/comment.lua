-- ~/.config/nvim/lua/adrian/comment.lua

require('Comment').setup({
  padding = true,
  sticky = true,
  ignore = nil,
  toggler = {
    line = '<leader>cc',
    block = '<leader>cb',
  },
  opleader = {
    line = 'gc',
    block = 'gb',
  },
  extra = {
    above = 'gcO',
    below = 'gco',
    eol = 'gcA',
  },
  mappings = {
    basic = true,
    extra = true,
  },
  pre_hook = nil,
  post_hook = nil,
})

