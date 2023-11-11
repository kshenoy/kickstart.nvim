return { -- Smarter abbrev, substitutes and case-coercions
  'tpope/vim-unimpaired',
  enabled = false,

  cond = function()
    return require('utils').is_neovim()
  end,
}
