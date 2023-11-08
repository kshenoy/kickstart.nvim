return {
  "echasnovski/mini.comment",

  cond = function()
    return require('custom.utils').is_neovim()
  end,

  opts = {
    options = {
      custom_commentstring = function()
        return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
      end,
    },
  },
}
