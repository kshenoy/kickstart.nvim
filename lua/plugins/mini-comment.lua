return {
  "echasnovski/mini.comment",

  cond = function()
    return require('utils').is_neovim()
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
