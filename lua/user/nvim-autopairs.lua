local autopairs_status_ok, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_status_ok then
  return
end

local rule_status_ok, rule = pcall(require, "nvim-autopairs.rule")
if not rule_status_ok then
  return
end

autopairs.setup {}

local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }
autopairs.add_rules {
  rule(' ', ' ')
    :with_pair(function (opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({
        brackets[1][1]..brackets[1][2],
        brackets[2][1]..brackets[2][2],
        brackets[3][1]..brackets[3][2],
      }, pair)
    end)
}
for _,bracket in pairs(brackets) do
  autopairs.add_rules {
    rule(bracket[1]..' ', ' '..bracket[2])
      :with_pair(function() return false end)
      :with_move(function(opts)
        return opts.prev_char:match('.%'..bracket[2]) ~= nil
      end)
      :use_key(bracket[2])
  }
end
