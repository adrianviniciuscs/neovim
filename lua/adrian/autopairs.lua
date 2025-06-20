-- ~/.config/nvim/lua/adrian/autopairs.lua

require("nvim-autopairs").setup({
  check_ts = true, -- Enable treesitter
  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" },
    java = false,
  },
  disable_filetype = { "TelescopePrompt", "spectre_panel" },
  disable_in_macro = true,
  disable_in_visualblock = false,
  disable_in_replace_mode = true,
  ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
  enable_moveright = true,
  enable_afterquote = true,
  enable_check_bracket_line = true,
  enable_bracket_in_quote = true,
  enable_abbr = false,
  break_undo = true,
  check_comma = true,
  map_cr = true,
  map_bs = true,
  map_c_h = false,
  map_c_w = false,
})

-- Integration with nvim-cmp
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- Custom rules
local Rule = require("nvim-autopairs.rule")
local npairs = require("nvim-autopairs")

-- Add spaces inside parentheses
npairs.add_rules({
  Rule(" ", " ")
    :with_pair(function(opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({ "()", "[]", "{}" }, pair)
    end),
  Rule("( ", " )")
    :with_pair(function() return false end)
    :with_move(function(opts)
      return opts.prev_char:match(".%)") ~= nil
    end)
    :use_key(")"),
  Rule("{ ", " }")
    :with_pair(function() return false end)
    :with_move(function(opts)
      return opts.prev_char:match(".%}") ~= nil
    end)
    :use_key("}"),
  Rule("[ ", " ]")
    :with_pair(function() return false end)
    :with_move(function(opts)
      return opts.prev_char:match(".%]") ~= nil
    end)
    :use_key("]"),
})
