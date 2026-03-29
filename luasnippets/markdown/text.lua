return {
  snippet({ trig = "mm", wordTrig = true, priority = 100000 }, fmta([[$<>$]], { vi(1) })),
  snippet(
    "block",
    fmta(
      [[
  ```<> 
    <>
  ```
  ]],
      { i(1), i(2) }
    )
  ),
  snippet(
    "gl",
    fmta(
      [[
  :::ex
  | <>
  | <>
  | <>
  | <>
  :::
  <>
  ]],
      { vi(1), vi(2), vi(3), vi(4), i(0) }
    )
  ),
}, {
  snippet({ trig = "mm", priority = 100000 }, fmta([[$<>$]], { vi(1) })),
}
