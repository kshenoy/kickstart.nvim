return {
  "JoosepAlviste/nvim-ts-context-commentstring",

  enabled = false,
  cond = function()
    return require('utils').is_neovim()
  end,
  lazy = true,

  opts = {
    enable_autocmd = false,
  },
}