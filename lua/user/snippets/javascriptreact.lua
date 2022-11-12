local ufc = s('ufc', fmt(
  [[
    useEffect(() => {{
      {}
    }}, [{}])
  ]],
  {
    i(1, 'body'),
    i(2, 'dependencies'),
  }
))

return {
  ufc,
}, {}
