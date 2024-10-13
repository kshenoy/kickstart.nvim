local M = {}

local function setup_keymaps()
  local map=vim.keymap.set
  local tb  = require('telescope.builtin')
  local wk  = require('which-key')
  local wkk = function(key, cmd, desc)
    wk.add({"<Leader>" .. key, cmd, desc=desc, mode="n"})
  end

  vim.keymap.set("n", "<Leader>'", tb.resume,   { desc="Resume last Telescope operation" })
  vim.keymap.set("n", "<Leader>:", tb.commands, { desc="Commands" })
  vim.keymap.set("n", "<Leader>;", tb.builtin,  { desc="Telescope pickers" })

  ---[[ Buffer bindings
  wk.add({ "<leader>b",  group="Buffers" })
  wkk("bb", tb.buffers,             "Switch buffers")
  wkk("bt", tb.current_buffer_tags, "Search current buffer's tags")
  --]]

  ---[[ File bindings
  wk.add({ "<leader>f",  group="Files" })
  wkk("ff", tb.find_files, "Find file")
  wkk("fr", tb.oldfiles,   "Find recent files")
  --]]

  ---[[ Help bindings
  -- Searching for things related to Neovim go here. Searching for things related to the code go in the Search keymap
  wk.add({"<leader>h",  group="Help"})
  wkk("hb", tb.keymaps,     "Search keybindings")
  wkk("hd", tb.diagnostics, "Search diagnostics")
  wkk("hh", tb.help_tags,   "Search help tags")
  wkk("hj", tb.jumplist,    "Search jumps")
  wkk("hk", tb.keymaps,     "Search keymaps")
  wkk("hl", tb.loclist,     "Search location-list")
  wkk("hm", tb.marks,       "Search marks")
  wkk("hq", tb.quickfix,    "Search quickfix")
  wkk("hr", tb.registers,   "Search registers")
  --]]

  ---[[ Search bindings
  -- Searching for things related to the code go here. Searching for things related to Neovim go in the Help keymap
  wk.add({ "<leader>s",  group="Search" })
  wkk("sb", tb.current_buffer_fuzzy_find, "Search current buffer")
  wkk("sg", tb.live_grep,                 "Search with grep")
  wkk("ss", tb.symbols,                   "Search symbols")
  wkk("st", tb.tags,                      "Search tags")
  wk.add({ "<leader>sv", "<Plug>(leader-vcs-map)/", desc="Search VCS", mode="n", remap=true, silent=true })
  wkk("s.", tb.grep_string, "Search word at point(.)")
  --]]

  ---[[ VCS bindings
  wk.add({ "<leader>v",  group="VCS" })
  wkk("vf", function()
    if require('custom.utils.vcs').find_git_root() then
      return tb.git_files()
    else
      return vim.cmd('Telescope vim_p4_files')
    end
  end, "VCS file")

  wkk("vc", tb.git_bcommits, "Buffer commits")
  wkk("vC", tb.git_commits,  "All Commits")
  wkk("vs", tb.git_status,   "VCS Status")
  wkk("v/", function()
    if require('utils.vcs').find_git_root() then
      vim.cmd('LiveGrepGitRoot')
    end
  end, "Search repo")
  --]]
end

function M.setup()
  setup_keymaps()
end

return M
