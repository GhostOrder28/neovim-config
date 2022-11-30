local ls_status_ok, ls = pcall(require, "luasnip")
if not ls_status_ok then
  echo("there is an error requiring luasnips")
end

local types_status_ok, types = pcall(require, "luasnip.util.types")
if not types_status_ok then
  echo("there is an error requiring types")
end

local filetype_functions_status_ok, filetype_functions = pcall(require, "luasnip.extras.filetype_functions")
if not filetype_functions_status_ok then
  return
end

local loader_status_ok, loader = pcall(require, "luasnip.loaders")
if not loader_status_ok then
  return
end

-- local lua_loader_status_ok, lua_loader = pcall(require, "luasnip.loaders.from_lua")
-- if not lua_loader_status_ok then
--   echo("there is an error requiring lua loader")
-- end

local snippets_path = "~/.config/nvim/lua/user/snippets"

require("luasnip.loaders.from_lua").load({ paths = snippets_path })

local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.config.set_config {
  history = true,
  update_events = "TextChanged, TextChangedI",
  enable_autosnippets = true,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "<-", "Error" } }
      }
    }
  },
}
ls.filetype_extend('typescriptreact', { 'javascript', 'javascriptreact', 'html' })
ls.filetype_extend('javascriptreact', { 'javascript', 'html' })
ls.filetype_extend('typescript', { 'javascript' })
ls.filetype_extend('vue', { 'javascript', 'html' })

local format_fn = function(file, source_name)
  if source_name == "lua" then return nil
  else return file:gsub(snippets_path, "$LuaSnip")
  end
end

keymap({ 'i', 's' }, '<c-k>', function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end)

keymap({ 'i', 's' }, '<c-j>', function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end)

keymap('i', '<c-l>', function ()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

keymap("n", "<c-s>", function ()
  loader.edit_snippet_files({
    format = format_fn
  })
end, opts)

vim.keymap.set('n', '<leader><leader>s', '<cmd>source ~/.config/nvim/lua/user/luasnip.lua<CR>')
