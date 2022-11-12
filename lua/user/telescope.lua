local telescope_status_ok, telescope = pcall(require, 'telescope')
if not telescope_status_ok then
  return
end

local builting_status_ok, builtin = pcall(require, "telescope.builtin")
if not builting_status_ok then
  return
end

local telescope_actions_status_ok, telescope_actions = pcall(require, "telescope.actions")
if not telescope_actions_status_ok then
  return
end

keymap('n', '<leader>f', builtin.find_files, {})
keymap('n', '<leader>r', builtin.live_grep, {})
keymap('n', '<leader>b', builtin.buffers, {})
keymap('n', '<leader>h', builtin.help_tags, {})

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = telescope_actions.close
      }
    }
  }
}
