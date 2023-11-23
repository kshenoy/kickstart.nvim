return {
  "echasnovski/mini.comment",

  cond = function()
    local utl = require('utils')
    return utl.is_neovim() and utl.is_plugin_loaded('nvim-treesitter')
  end,

  opts = {
    options = {
      custom_commentstring = function()
        local ts_context_commentstring = require('utils').prequire("ts_context_commentstring.internal")
        if ts_context_commentstring then
          return ts_context_commentstring.calculate_commentstring() or vim.bo.commentstring
        else
          return vim.bo.commentstring
        end
      end,
    },
  },
}
