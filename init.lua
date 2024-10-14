-- Define leader and some keymaps ahead of time.
-- This needs to be the first thing so that everything else can make use of it
require('custom.keymaps.setup')

-- Load kickstart
require('kickstart')

-- Now load the rest of my configuration.
-- These are all stored in the lua folder to keep it modular and distinct from kickstart's config
-- Note that the package manager (lazy.nvim) automatically loads all the plugins specified in plugins
-- So I don't have to specify that explicitly
require('custom.options')
require('custom.keymaps')
