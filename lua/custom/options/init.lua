vim.o.timeoutlen = 500                                     -- Kickstart's default is too low at 300ms

if require('custom.utils').is_neovim() then
  require('custom.options.neovim-only')
end
