local M = {}

local function setup_keymaps()
  local map = vim.keymap.set
  local tb  = require('telescope.builtin')

  map('n', "<Leader>'", tb.resume,            { desc = 'Resume last Telescope operation' })
  map('n', '<Leader>:', tb.commands,          { desc = 'Commands' })
  map('n', '<Leader>;', '<Cmd>Telescope<CR>', { desc = 'Telescope picker' })

  ---[[ Buffer bindings
  map('n', '<Plug>(leader-buffer-map)b', tb.buffers,             { desc = 'Switch to [b]uffers' })
  map('n', '<Plug>(leader-buffer-map)t', tb.current_buffer_tags, { desc = "Search current buffer's tags" })
  --]]

  ---[[ File bindings
  map('n', '<Plug>(leader-file-map)f', tb.find_files, { desc = '[f]ind [f]iles' })
  map('n', '<Plug>(leader-file-map)r', tb.oldfiles,   { desc = '[f]iles opened [r]ecently' })
  --]]

  ---[[ Help bindings
  map('n', '<Plug>(leader-help-map)b', tb.keymaps,   { desc = 'Search key[b]indings' })
  map('n', '<Plug>(leader-help-map)h', tb.help_tags, { desc = 'Search help [t]ags' })
  --]]

  ---[[ Search bindings
  map('n', '<Plug>(leader-search-map)b', tb.current_buffer_fuzzy_find, { desc = '[s]earch current [b]uffer]' })
  map('n', '<Plug>(leader-search-map)d', tb.diagnostics,               { desc = '[s]earch [d]iagnostics'     })
  map('n', '<Plug>(leader-search-map)g', tb.live_grep,                 { desc = '[s]earch with [g]rep'       })
  map('n', '<Plug>(leader-search-map)j', tb.jumplist,                  { desc = '[s]earch [j]umps'           })
  map('n', '<Plug>(leader-search-map)l', tb.loclist,                   { desc = '[s]earch [l]ocation-list'   })
  map('n', '<Plug>(leader-search-map)m', tb.marks,                     { desc = '[s]earch [m]arks'           })
  map('n', '<Plug>(leader-search-map)q', tb.quickfix,                  { desc = '[s]earch [q]uickfix'        })
  map('n', '<Plug>(leader-search-map)r', tb.registers,                 { desc = '[s]earch [r]egisters'       })
  map('n', '<Plug>(leader-search-map)s', tb.symbols,                   { desc = '[s]earch [s]ymbols'         })
  map('n', '<Plug>(leader-search-map)t', tb.tags,                      { desc = '[s]earch [t]ags'            })
  map('n', '<Plug>(leader-search-map)v', '<Plug>(leader-vcs-map)/',
    { desc = '[s]earch [v]cs root', remap = true, silent = true })
  map('n', '<Plug>(leader-search-map)w', tb.grep_string,               { desc = '[s]earch current [w]ord'    })
  --]]

  ---[[ VCS bindings
  map('n', '<Plug>(leader-vcs-map)f', tb.git_files,           { desc = '[v]cs [f]ile'          })
  map('n', '<Plug>(leader-vcs-map)c', tb.git_bcommits,        { desc = '[v]cs [c]ommits (buf)' })
  map('n', '<Plug>(leader-vcs-map)C', tb.git_commits,         { desc = '[v]cs [C]ommits (all)' })
  map('n', '<Plug>(leader-vcs-map)s', tb.git_status,          { desc = '[v]cs [s]tatus'        })
  map('n', '<Plug>(leader-vcs-map)/', ':LiveGrepGitRoot<cr>', { desc = '[v]cs [s]earch all'    })
  --]]
end

function M.setup()
  setup_keymaps()
end

return M
