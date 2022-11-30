local const = s('co', { t("const "), i(1), t(" = "), i(2), t(";") })

local log = s('log', fmt(
  [[
    console.log({});
  ]],
  { i(1, 'statement') }
))

local forof = s('fo', fmt(
  [[
    for ({}) {{
      {}
    }};
  ]],
  {
    c(1, {
      sn(1, {
        t('const '),
        i(1, 'index'),
        t(' of '),
        i(2, 'array'),
      }),
      sn(2, {
        t('let i = 0; i < '),
        i(1, 'value'),
        t('; i++'),
      }),
      sn(0, {
        t('const '),
        i(1, 'property'),
        t(' in '),
        i(2, 'object'),
      }),
    }),
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

local if_condition = s('if', fmt(
  [[
    if ({}) {{
      {}
    }};
  ]],
  {
    i(1, 'condition'),
    i(0, 'statement'),
  }
))

local else_condition = s('el', fmt(
  [[
    else {{
      {}
    }};
  ]],
  {
    i(1, 'statement')
  }
))

local try = s('try', fmt(
  [[
    try {{
      {}
    }} catch (err) {{
      {}
    }}
  ]],
  {
    i(1, 'statement'),
    i(0, 'error handler'),
  }
))

local jest_tests = s('it', fmt(
  [[
    {}('{}', () => {{
      {}
    }})
  ]],
  {
    c(1, { t('it'), t('test'), t('describe') }),
    i(2, 'description'),
    i(0, '// test'),
  }
))

-- nodejs specifics

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
  if_condition,
  else_condition,
  try,
  jest_tests,
  -- nodejs specifics
  req,
}, {}
