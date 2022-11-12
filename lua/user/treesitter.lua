local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = { 
    'javascript', 
    'typescript', 
    'lua', 
    'python', 
    'css',
    'json',
    'markdown'
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,    
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
}


