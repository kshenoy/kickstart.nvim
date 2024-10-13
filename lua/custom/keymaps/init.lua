-- See `:help vim.keymap.set()`
local map = vim.keymap.set


--[[ Remapping for a better default experience ]]-----------------------------------------------------------------------
-- Move by visual lines if count is not supplied. If a count is supplied then move by normal lines.
-- This makes it easy to supply a count to line-based operations such as yank/delete without worrying about visual lines
map({'n', 'v', 'o', 's', 'x'}, 'j', "v:count == 0 ? 'gj' : 'j'", {expr=true})
map({'n', 'v', 'o', 's', 'x'}, 'gj', 'j')
map({'n', 'v', 'o', 's', 'x'}, 'k', "v:count == 0 ? 'gk' : 'k'", {expr=true})
map({'n', 'v', 'o', 's', 'x'}, 'gk', 'k')

-- 'n' always searches forward and 'N' always searches backward
map({'n', 'v', 'o', 's', 'x'}, 'n', "v:searchforward == 1 ? 'n' : 'N'", {expr=true, desc="'n' always searches forward"})
map({'n', 'v', 'o', 's', 'x'}, 'N', "v:searchforward == 1 ? 'N' : 'n'", {expr=true, desc="'N' always searches back"})

-- Swap 'U' and 'C-R'
map('n', '<C-R>', 'U',     {silent=true})
map('n', 'U',     '<C-R>', {silent=true})

-- Remap 'w' to behave as 'w' should in all cases (:h cw). Use `ce` to do what `cw` used to
map('n', 'cw', 'dwi')
map('n', 'cW', 'dWi')


--[[ Buffers ]]---------------------------------------------------------------------------------------------------------
-- Switching buffers is something I do often, so make that as fast as possible
map('n', '<Leader><Leader>', '<Plug>(leader-buffer-map)b', {remap=true, silent=true})


--[[ Indentation and styling ]]-----------------------------------------------------------------------------------------
-- Preserve visual block after indenting, increment/decrement
map('v', '>',     '>gv')
map('v', '<',     '<gv')
map('v', '<C-A>', '<C-A>gv')
map('v', '<C-X>', '<C-X>gv')

--[[ Search and Replace ]]----------------------------------------------------------------------------------------------
-- Use very-magic (PCRE-ish) while searching
map('n', '/',   '/\\v')
map('n', '?',   '?\\v')
map('c', '%s/', '%s/\\v')
map('c', '.s/', '.s/\\v')
map('x', ':s/', ':s/\\%V\\v')

-- Replace word under the cursor. Type replacement, press `<ESC>`. Use `.` to jump to next occurence and repeat
map('n', 'c*',  '*<C-O>cgn')
map('n', 'cg*', 'g*<C-O>cgn')
-- map('n', 'z*',  '*<C-O>',  {silent=true, desc="Highlight word under cursor"})
-- map('n', 'zg*', 'g*<C-O>', {silent=true, desc="Highlight word under cursor"})


--[[ Misc ]]------------------------------------------------------------------------------------------------------------
-- Fill Text Width
map('n', '<Leader>mf', require('custom.utils').fill_width, {silent=true})


--[[ Plugin related keymaps ]]------------------------------------------------------------------------------------------
-- Load keymaps that are specific to Neovim
if require('custom.utils').is_neovim() then
  require('keymaps.neovim-only')
end

if require('custom.utils').is_vscode() then
  require('keymaps.vscode-only')
end
