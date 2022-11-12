local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

nvim_tree.setup {
  view = {
    mappings = {
      list = {
        { key = 'a', action = 'edit' },
        { key = 'A', action = 'create' },
        { key = '<Tab>', action = '' },
        { key = 'q', action = 'dir_up' },
      }
    }
  }
}

keymap("n", "<F2>", ":NvimTreeFindFile<cr>", opts)
