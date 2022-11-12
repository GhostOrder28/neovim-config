local opts = { noremap = true, silent = true }
local hop_status_ok, hop = pcall(require, "hop")
if not hop_status_ok then
  return
end

hop.setup {}

keymap("n", "s", ":HopChar1<cr>", opts)
keymap("n", "S", ":HopChar2<cr>", opts)
keymap("n", "f", ":HopPattern<cr>", opts)
