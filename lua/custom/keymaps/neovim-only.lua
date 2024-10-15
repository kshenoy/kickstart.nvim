local map = vim.keymap.set

--[[ Remapping for convenience ]]---------------------------------------------------------------------------------------
-- Display full path and filename
map('n', '<C-G>', '2<C-G>')

-- Remap `ZQ` to quit everything. I can always use `:bd` to delete a single buffer
map('n', 'ZQ', '<Cmd>qall!<CR>')

-- Copy the file name to unix visual select buffer
map('n', '<Plug>(leader-file-map)y', function()
  vim.cmd('let @+="' .. vim.fn.expand('%:p') .. '"')
end, {desc="Copy file path"})


-- [[ Code -------------------------------------------------------------------------------------------------------------
map('n', '<Plug>(leader-code-map)r', vim.lsp.buf.rename,      { desc = '[c]ode [r]ename' })
map('n', '<Plug>(leader-code-map)a', vim.lsp.buf.code_action, { desc = '[c]ode [a]ction' })
--]]


--[[ Files -------------------------------------------------------------------------------------------------------------
local fzf_lua_p4 = require('neovim-only.fzf-lua.perforce')

-- Checkout the file if in a VCS
map('n', '<Plug>(leader-vcs-map)e', function()
  if fzf_lua_p4.is_p4_repo({}, true) then
    vim.cmd "!p4 edit %"
  end
end, {desc = "Checkout file"})


map('n', '<Plug>(leader-vcs-map)s', function()
  if require('fzf-lua.path').is_git_repo({}, true) then
    return require('fzf-lua').git_status()
  elseif fzf_lua_p4.is_p4_repo({}, true) then
    return fzf_lua_p4.status()
  end
end, {desc="Repo status"})
--]]


---[[ Misc -------------------------------------------------------------------------------------------------------------
map('n', '<Plug>(leader-kustom-map)l', function()
  if ((vim.fn.getloclist(0, { winid = 0 }).winid or 0) == 0) then
    vim.cmd "lopen"
  else
    vim.cmd "lclose"
  end
end, {desc = "Toggle LocationList"})


map('n', '<Plug>(leader-kustom-map)q', function()
  for _, win in pairs(vim.fn.getwininfo()) do
    if ((win.quickfix == 1) and (win.loclist == 0)) then
      vim.cmd('cclose')
      return
    end
  end
  vim.cmd('copen')
end, {desc = "Toggle QuickFix"})


map('n', '<Plug>(leader-toggle-map)w', function()
  require('custom.utils').toggle_opt('wrap')
end, {desc = "Toggle Wrap"})
