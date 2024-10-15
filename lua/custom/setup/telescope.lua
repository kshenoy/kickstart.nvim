local M = {}

local function setup_keymaps()
  local tb = require('telescope.builtin')
  local wk = require('which-key')

  local map = function(keys, func, desc, mode)
    mode = mode or 'n'
    -- vim.keymap.set(mode, keys, func, { desc=desc })
    wk.add({ keys, func, desc=desc, mode=mode })
  end

  map("<Leader>'", tb.resume,   "Resume last Telescope operation")
  map("<Leader>:", tb.commands, "Commands")
  map("<Leader>;", tb.builtin,  "Telescope pickers")

  ---[[ Buffer bindings
  wk.add({ "<leader>b",  group="Buffers" })
  map("<leader>bb", tb.buffers,             "Switch buffers")
  map("<leader>bt", tb.current_buffer_tags, "Search current buffer's tags")

  -- FIXME: Hack till I figure out how to get which-key working with keymap prefix
  wk.add({
    { "<Leader><Leader>", "<Leader>bb", remap=true }
  })
  --]]

  ---[[ File bindings
  wk.add({ "<leader>f",  group="Files" })
  map("<leader>ff", tb.find_files, "Find file")
  map("<leader>fr", tb.oldfiles,   "Find recent files")
  --]]

  ---[[ Goto bindings
  wk.add({ "<leader>g",  group="Goto…" })
  map("<leader>gf", tb.find_files, "Find file")
  map("<leader>gr", tb.oldfiles,   "Find recent files")
  --]]

  ---[[ Info bindings
  -- Searching for things related to Neovim go here. Searching for things related to the code go in the Search keymap
  wk.add({"<leader>i",  group="Info…"})
  map("<leader>id", tb.diagnostics, "Search diagnostics")
  map("<leader>ih", tb.help_tags,   "Search help tags")
  map("<leader>ij", tb.jumplist,    "Search jumps")
  map("<leader>ik", tb.keymaps,     "Search keymaps")
  map("<leader>il", tb.loclist,     "Search location-list")
  map("<leader>im", tb.marks,       "Search marks")
  map("<leader>iq", tb.quickfix,    "Search quickfix")
  map("<leader>ir", tb.registers,   "Search registers")
  --]]

  ---[[ Search bindings
  -- Searching for things related to the code go here. Searching for things related to Neovim go in the Help keymap
  wk.add({ "<leader>s",  group="Search…"})
  map("<leader>sb",      tb.current_buffer_fuzzy_find, "Search current buffer")
  map("<leader>sB",      tb.live_grep,                 "Search all buffers")
  map("<leader>ss",      tb.symbols,                   "Search symbols")
  map("<leader>st",      tb.tags,                      "Search tags")
  wk.add({ "<leader>sv", "<Plug>(leader-vcs-map)/",    desc="Search VCS", remap=true, silent=true })
  map("<leader>s.",      tb.grep_string,               "Search word at point(.)")
  --]]

  ---[[ VCS bindings
  wk.add({ "<leader>v",  group="VCS…" })
  map("<leader>vf",
      function()
        if require('custom.utils.vcs').find_git_root() then
          return tb.git_files()
        else
          return vim.cmd('Telescope vim_p4_files')
        end
      end, "VCS file")
  map("<leader>vc", tb.git_bcommits, "Buffer commits")
  map("<leader>vC", tb.git_commits,  "All Commits")
  map("<leader>vs", tb.git_status,   "VCS Status")
  map("<leader>v/",
      function()
        if require('custom.utils.vcs').find_git_root() then
          vim.cmd('LiveGrepGitRoot')
        end
      end, "Search repo")
  --]]
end

function M.setup()
  setup_keymaps()
end

return M
