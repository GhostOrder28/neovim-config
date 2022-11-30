local opts = { noremap = true, silent = true }
keymap = vim.keymap.set

keymap("n", "<A-j>", "<Esc>:m .+1<CR>===gi", opts)
keymap("n", "<A-k>", "<Esc>:m *-2<CR>===gi", opts)

keymap("n", "<space>", ":startinsert<CR>", opts)
keymap("n", "<F1>", ":w<CR>", opts)                           -- save current document
-- keymap({ 'n', 's' }, "w", "b", opts)                                   -- go back one word
-- keymap({ 'n', 's' }, "e", "w", opts)                                   -- go forward one word
-- keymap({ 'n', 's' }, "E", "$", opts)                                   -- go to end of the line
-- keymap({ 'n', 's' }, "W", "0", opts)                                   -- go to begin of the line
keymap("n", "<leader>s", ":set hlsearch!<CR>", opts)          -- switch search highlighting
keymap("n", "<leader>a", ":NvimTreeToggle<CR>", opts)         -- toogle nvim-tree
keymap("n", "<leader>d", ":NvimTreeFindFile<CR>", opts)       -- focus current buffer in nvim-tree
keymap("n", "<tab>", "<C-W>w", opts)                          -- alternate between splits
keymap("n", "`", "<C-^>", opts)                               -- alternte between buffers
keymap("n", "<C-h>", ":vertical resize -10 <CR>", opts)
keymap("n", "<C-l>", ":vertical resize +10 <CR>", opts)
