vim.o.timeoutlen = 500                                                        -- Kickstart's default is too low at 300ms

-- Neovim already has a lot of sane defaults. Here's some more.
if require('custom.utils').is_neovim() then
  --[[ Moving around, searching and patterns ]]-------------------------------------------------------------------------
  vim.o.autochdir = true                                                           -- change directory to file in window


  --[[ Tags ]]----------------------------------------------------------------------------------------------------------
  vim.opt.tags = "./tags;,./.tags;"                                             -- list of file names to search for tags


  --[[ Displaying text ]]-----------------------------------------------------------------------------------------------
  vim.o.scrolloff     = 3                                          -- no. of lines to show around the cursor for context
  vim.o.breakindent   = true                                                     -- preserve indentation in wrapped text
  vim.o.showbreak     = "↪"                                               -- string to put at the start of wrapped lines
  vim.o.sidescroll    = 3                                            -- minimal number of columns to scroll horizontally
  vim.o.sidescrolloff = 10                                       -- no. of columns to show around the cursor for context
  vim.o.cmdheight     = 2      -- number of screen lines to use for the command-line. Helps avoiding 'hit-enter' prompts
  vim.o.list          = true                                                         -- make it easier to see whitespace
  vim.opt.listchars   = {tab='» ', extends='›', precedes='‹', nbsp='·', trail='·'} -- list of strings used for list mode
  vim.o.number = false                                                                        -- don't show line numbers
  vim.o.conceallevel  = 2                                                         -- concealed text is completely hidden
  vim.o.concealcursor = "nc"                         -- conceal text in the cursor line in normal and command-line modes


  --[[ Syntax, highlighting and spelling ]]-----------------------------------------------------------------------------
  vim.o.hlsearch      = true                                   -- highlight all matches for the last used search pattern
  vim.o.termguicolors = true                                                       -- enable 24-bit RGB color in the TUI
  vim.o.cursorline    = true                                                  -- highlight the screen line of the cursor
  vim.o.colorcolumn   = "+1"                                                       -- highlight Column 121 (textwidth+1)


  --[[ Multiple windows, tab pages ]]-----------------------------------------------------------------------------------
  vim.o.laststatus = 3                                                                       -- enable global statusline
  vim.o.splitbelow = true                                                     -- new window is put below the current one
  vim.o.splitright = true                                           -- new window is put to the right of the current one


  --[[ Using the mouse ]]-----------------------------------------------------------------------------------------------
  vim.o.mouse = "ar"                                                                           -- use mouse in all modes


  --[[ Messages and Info ]]---------------------------------------------------------------------------------------------
  vim.o.showmode = false                                                  -- display the current mode in the status line


  --[[ Selecting text ]]------------------------------------------------------------------------------------------------
  vim.opt.clipboard:remove('unnamedplus')           -- do not automatically add all yanked/deleted text to the clipboard


  --[[ Editing text ]]--------------------------------------------------------------------------------------------------
  vim.o.undofile  = true                                                  -- automatically save and restore undo history
  vim.o.textwidth = 120                                                       -- line length above which to break a line
  vim.opt.completeopt:append('menuone')                          -- use the popup menu also when there is only one match
  vim.opt.completeopt:append('noinsert')                         -- do not insert any text for a match until I select it
  vim.opt.completeopt:append('noselect')                              -- do not select a match in the menu automatically
  vim.o.showmatch  = true                                                                      -- show matching brackets


  --[[ Tabs and indenting ]]--------------------------------------------------------------------------------------------
  vim.o.expandtab   = true                                                      -- expand <Tab> to spaces in Insert mode
  vim.o.shiftwidth  = 2                                           -- number of spaces used for each step of (auto)indent
  vim.o.softtabstop = -1                                                                    -- Use value from shiftwidth
  vim.o.shiftround  = true                                                    -- round to 'shiftwidth' for "<<" and ">>"


  --[[ Reading and writing files, swap file ]]--------------------------------------------------------------------------
  vim.o.backup   = true                                                        -- keep a backup after overwriting a file
  vim.opt.backupdir:remove(".")                                            -- list of directories to put backup files in
  vim.o.swapfile = false                                                                      -- don't create swap files


  --[[ Command line editing ]]------------------------------------------------------------------------------------------
  vim.opt.suffixes:remove(".h")                                                      -- always show all .h files with :e
  vim.opt.wildmode = {"longest:full" ,"full"}     -- insert longest match and show completions menu upon first Tab-press
  -- cycle through possible matches with consecutive Tab-presses


  --[[ Running make and jumping to errors (quickfix) ]]-----------------------------------------------------------------
  if (vim.fn.executable('rg')) then
    vim.opt.grepformat = "%f:%l:%m"
    vim.opt.grepprg    = "rg --vimgrep --smart-case"
  end
end
