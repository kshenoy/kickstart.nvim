local M = {}

function M.setup_keymaps(bufnr)
  local tb  = require('telescope.builtin')
  local wk  = require('which-key')

  local map = function(keys, func, desc, mode)
    mode = mode or 'n'
    -- vim.keymap.set(mode, keys, func, { desc=desc })
    wk.add({ keys, func, desc=desc, mode=mode, buffer=bufnr })
  end

  vim.keymap.set('n', "<C-k>", vim.lsp.buf.signature_help, { desc="Signature Documentation" })

  map("<leader>wa", vim.lsp.buf.add_workspace_folder, "Add folder to workspace")
  map("<leader>wr", vim.lsp.buf.remove_workspace_folder, 'Remove folder from workspace')
  map("<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "List folders in workspace")

  -- Jump to the definition of the word under your cursor.
  --  This is where a variable was first declared, or where a function is defined, etc.
  --  To jump back, press <C-t>.
  -- map("<leader>gd", tb.lsp_definitions, "Goto Definition")

  -- Find references for the word under the cursor.
  map("<leader>gr", tb.lsp_references, "Goto References")

  -- Jump to the implementation of the word under your cursor.
  --  Useful when your language has ways of declaring types without an actual implementation.
  map("<leader>gI", tb.lsp_implementations, "Goto Implementation")

  -- Jump to the type of the word under your cursor.
  --  Useful when you're not sure what type a variable is and you want to see
  --  the definition of its *type*, not where it was *defined*.
  map("<leader>gD", tb.lsp_type_definitions, "Type Definition")

  -- Fuzzy find all the symbols in your current document.
  --  Symbols are things like variables, functions, types, etc.
  map("<leader>gs", tb.lsp_document_symbols, "Document Symbols")

  -- Fuzzy find all the symbols in your current workspace.
  --  Similar to document symbols, except searches over your entire project.
  map("<leader>gS", tb.lsp_dynamic_workspace_symbols, "Workspace Symbols")

  -- Rename the variable under your cursor.
  --  Most Language Servers support renaming across files, etc.
  map("<leader>cr", vim.lsp.buf.rename, "Code Rename")

  -- Execute a code action, usually your cursor needs to be on top of an error
  -- or a suggestion from your LSP for this to activate.
  map("<leader>ca", vim.lsp.buf.code_action, "Code Action", { 'n', 'x' })

  -- WARN: This is not Goto Definition, this is Goto Declaration.
  --  For example, in C this would take you to the header.
  map("<leader>gk", vim.lsp.buf.declaration, "Goto Declaration")
end

return M
