-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
keymap('n', '<space>e', vim.diagnostic.open_float, opts)
keymap('n', '[d', vim.diagnostic.goto_prev, opts)
keymap('n', ']d', vim.diagnostic.goto_next, opts)
keymap('n', '<space>q', vim.diagnostic.setloclist, opts)

local buf = vim.lsp.buf
local diag = vim.diagnostic

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  keymap('n', 'gD', buf.declaration, bufopts)
  keymap('n', 'gd', buf.definition, bufopts)
  keymap('n', 'X', buf.hover, bufopts)
  keymap('n', 'gi', buf.implementation, bufopts)
  keymap('n', '<C-k>', buf.signature_help, bufopts)
  keymap('n', '<space>wa', buf.add_workspace_folder, bufopts)
  keymap('n', '<space>wr', buf.remove_workspace_folder, bufopts)
  keymap('n', '<space>wl', function()
    print(vim.inspect(buf.list_workspace_folders()))
  end, bufopts)
  keymap('n', '<space>D', buf.type_definition, bufopts)
  keymap('n', '<space>rn', buf.rename, bufopts)
  keymap('n', '<space>ca', buf.code_action, bufopts)
  keymap('n', 'gr', buf.references, bufopts)

  -- diagnostics
  keymap('n', '<leader>x', diag.open_float, bufopts)
  keymap("n", "g]", diag.goto_next, opts)
  keymap("n", "g[", diag.goto_prev, opts)
end

return on_attach
