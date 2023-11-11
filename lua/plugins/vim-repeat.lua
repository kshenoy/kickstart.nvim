return {
  'tpope/vim-repeat',

  cond = function()
    return require('utils').is_neovim()
  end,
}
