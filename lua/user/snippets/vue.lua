local vue = s('vue', fmt(
  [[
    <template>
      {}
    </template>

    <script>
      export default {{
        {}
      }}
    </script>

    <style>
      {}
    </style>
  ]],
  {
    i(1, ''),
    i(2, ''),
    i(0, ''),
  }
))

return {
  vue,
}, {}
