vim.o.timeoutlen = 500                                     -- Kickstart's default is too low at 300ms

if require('utils').is_neovim() then
  require('options.neovim-only')
end
