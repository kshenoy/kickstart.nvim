-- Collection of general utility functions
local M = {}

function M.is_neovim()
  return vim.fn.empty(vim.g.vscode) == 1
end

function M.is_vscode()
  return vim.fn.empty(vim.g.vscode) ~= 1
end

function M.prequire(...)
  local status, lib = pcall(require, ...)
  if (status) then return lib end
  --Library failed to load, so perhaps return `nil` or something?
  return nil
end

function M.is_plugin_loaded(plugin)
  return vim.tbl_get(require('lazy.core.config').plugins, plugin) ~= nil
end

-- function M.opt_toggle(opt)
--   local o = vim.opt[opt]
--   o = not o:get()
--   vim.notify(o.['_name'] .. " " .. (o:get() and "Enabled" or "Disabled"))
-- end

return M
