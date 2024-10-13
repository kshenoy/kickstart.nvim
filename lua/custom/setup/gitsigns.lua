local M = {}

function M.setup_keymaps(bufnr)
  local gs = package.loaded.gitsigns
  local map = vim.keymap.set

  map('n', '<Plug>(leader-vcs-map)h', gs.preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })

  -- don't override the built-in and fugitive keymaps
  map({ 'n', 'v' }, ']c', function()
    if vim.wo.diff then
      return ']c'
    end
    vim.schedule(function()
      gs.next_hunk()
    end)
    return '<Ignore>'
  end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })

  map({ 'n', 'v' }, '[c', function()
    if vim.wo.diff then
      return '[c'
    end
    vim.schedule(function()
      gs.prev_hunk()
    end)
    return '<Ignore>'
  end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })
end

return M
