local const = s('co', { t("const "), i(1), t(" = "), i(2), t(";") })
local log = s('log', fmt(
  [[
    console.log({});
  ]],
  { i(1, 'statement') }
))
local forof = s('fo', fmt(
  [[
    for (const {} of {}) {{
      {}
    }};
  ]],
  {
    i(1, ''),
    i(2, ''),
    i(0, ''),
  }
))
local fn = s('fn', fmt(
  [[
    function {} ({}) {{
      {}   
    }};
  ]],
  {
    i(1, 'name'),
    i(2, 'arg'),
    i(0, 'body')
  }
))
local req = s('req', fmt(
  [[
    const {} = require('{}');
  ]],
  {
    i(1, 'module'),
    rep(1),
  }
))

return {
  const,
  forof,
  fn,
  log,
  -- nodejs specifics
  req,
}, {}
