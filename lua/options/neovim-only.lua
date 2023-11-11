-- Neovim already has a lot of sane defaults. Here's some more.


--[[ Moving around, searching and patterns ]]---------------------------------------------------------------------------
vim.o.autochdir = true                                                             -- change directory to file in window


--[[ Tags ]]------------------------------------------------------------------------------------------------------------
vim.opt.tags = "./tags;,./.tags;"


--[[ Displaying text ]]-------------------------------------------------------------------------------------------------
vim.o.scrolloff     = 3                                            -- no. of lines to show around the cursor for context
vim.o.breakindent   = true                                                       -- preserve indentation in wrapped text
vim.o.showbreak     = "↪"                                                 -- string to put at the start of wrapped lines
vim.o.sidescroll    = 3                                              -- minimal number of columns to scroll horizontally
vim.o.sidescrolloff = 10                                         -- no. of columns to show around the cursor for context
vim.o.cmdheight     = 2        -- number of screen lines to use for the command-line. Helps avoiding 'hit-enter' prompts
vim.o.list          = true                                                           -- make it easier to see whitespace
vim.opt.listchars   = {tab='» ', extends='›', precedes='‹', nbsp='·', trail='·'}
vim.o.conceallevel  = 2
vim.o.concealcursor = "nc"


--[[ Syntax, highlighting and spelling ]]-------------------------------------------------------------------------------
vim.o.termguicolors = true                                                         -- enable 24-bit RGB color in the TUI
vim.o.cursorline    = true                                                    -- highlight the screen line of the cursor
vim.o.colorcolumn   = "+1"                                                         -- highlight Column 121 (textwidth+1)


--[[ Multiple windows, tab pages ]]-------------------------------------------------------------------------------------
vim.o.laststatus = 3                                                                         -- enable global statusline
vim.o.splitbelow = true
vim.o.splitright = true


--[[ Using the mouse ]]-------------------------------------------------------------------------------------------------
vim.o.mouse = "ar"                                                                             -- use mouse in all modes


--[[ Messages and Info ]]-----------------------------------------------------------------------------------------------
vim.o.showmode = false
vim.o.number = false
vim.o.number = false


--[[ Editing text ]]----------------------------------------------------------------------------------------------------
vim.o.undofile  = true
vim.o.textwidth = 120
vim.opt.completeopt:append('menuone')                            -- use the popup menu also when there is only one match
vim.opt.completeopt:append('noinsert')                           -- do not insert any text for a match until I select it
vim.opt.completeopt:append('noselect')                                -- do not select a match in the menu automatically
vim.o.showmatch  = true                                                                        -- show matching brackets


--[[ Tabs and indenting ]]----------------------------------------------------------------------------------------------
vim.o.expandtab   = true
vim.o.shiftwidth  = 2
vim.o.softtabstop = -1                                                                      -- Use value from shiftwidth
vim.o.shiftround  = true


--[[ Reading and writing files, swap file ]]----------------------------------------------------------------------------
vim.o.backup   = true
vim.opt.backupdir:remove(".")
vim.o.swapfile = false
vim.o.updatetime = 250


--[[ Command line editing ]]--------------------------------------------------------------------------------------------
vim.opt.suffixes:remove(".h")                                                        -- always show all .h files with :e
vim.opt.wildmode = {"longest:full" ,"full"}  -- insert longest match and show a menu of completions upon first Tab-press
                                             -- cycle through possible matches with consecutive Tab-presses


--[[ Running make and jumping to errors (quickfix) ]]-------------------------------------------------------------------
if (vim.fn.executable('rg')) then
  vim.opt.grepformat = "%f:%l:%m"
  vim.opt.grepprg    = "rg --vimgrep --smart-case"
end


--[[ Misc ]]------------------------------------------------------------------------------------------------------------
vim.opt.clipboard:append('unnamedplus')
