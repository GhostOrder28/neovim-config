local localPCall = s('lpc', fmt(
  [[
    local {}_status_ok, {} = pcall(require, "{}")
    if not {}_status_ok then
      return
    end
  ]],
  {
    i(1, ''),
    rep(1),
    i(0, ''),
    rep(1),
  }
))

local keymap = s('kmp', fmt(
  [[
    keymap("{}", "{}", "{}", opts)
  ]],
  {
    i(1, ''),        
    i(2, ''),        
    i(3, ''),        
  }
))

return {
  localPCall,
  keymap
}, {}

