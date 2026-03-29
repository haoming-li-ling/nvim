return {
  snippet(
    { trig = "([a-zA-Z])([0-9]+)", regTrig = true },
    fmta([[<>_{<>}]], { l(l.CAPTURE1), l(l.CAPTURE2) }),
    math_mode
  ),
  snippet(
    { trig = "([a-zA-Z])([ijk]+)", regTrig = true },
    fmta([[<>_{<>}]], { l(l.CAPTURE1), l(l.CAPTURE2) }),
    math_mode
  ),
  snippet("card", fmta([[\lvert <> \rvert]], { i(1) }), math_mode),
  -- snippet("set", fmta([[\{ <> \}]], { vi(1) }), math_mode),
  snippet("set", fmta([[\set{<>}]], { vi(1) }), math_mode),
  snippet("abs", fmta([[\lvert <> \rvert]], { i(1) }), math_mode),
  snippet("Set", fmta([[\left\{ <> \right\}]], { i(1) }), math_mode),
  snippet("comp", fmta([[\{ <> : <> \}]], { i(1), i(2) }), math_mode),
  snippet("op", fmta([[\operatorname{<>}]], { i(1) }), math_mode),

  snippet("ph", t([[&\phantom{{}={}}]]), math_mode),
  -- snippet(
  --   { trig = "([a-z])%+([a-z])", regTrig = true, priority = 3000 },
  --   fmta([[\mathbf{<>} \oplus \mathbf{<>}]], { l(l.CAPTURE1), l(l.CAPTURE2) }),
  --   math_mode
  -- ),
  snippet(
    { trig = "([a-z])%+([a-z])", regTrig = true, priority = 3000 },
    fmta([[<> \oplus <>]], { l(l.CAPTURE1), l(l.CAPTURE2) }),
    math_mode
  ),
  -- snippet(
  --   { trig = "([a-z])%+([a-z])%+([a-z])", regTrig = true, priority = 4000 },
  --   fmta(
  --     [[\mathbf{<>} \oplus \mathbf{<>} \oplus \mathbf{<>}]],
  --     { l(l.CAPTURE1), l(l.CAPTURE2), l(l.CAPTURE3) }
  --   ),
  --   math_mode
  -- ),
  snippet(
    { trig = "([a-z])%+([a-z])%+([a-z])", regTrig = true, priority = 4000 },
    fmta([[<> \oplus <> \oplus <>]], { l(l.CAPTURE1), l(l.CAPTURE2), l(l.CAPTURE3) }),
    math_mode
  ),
  postfix(
    { trig = "/", name = "fraction", priority = 2000, match_pattern = "%b()$" },
    fmta([[\frac{<>}{<>}]], { l(l.POSTFIX_MATCH:sub(2, -2)), i(1) }),
    math_mode
  ),

  snippet({ trig = "//", name = "fraction", priority = 3000 }, fmta([[\frac{<>}{<>}]], { i(1), i(2) }), math_mode),
  snippet(
    "ca",
    fmta(
      [[
  \begin{cases}
    <> & <> \\
    <> & <>
  \end{cases}
  ]],
      { i(1), i(2), i(3), i(4) }
    ),
    math_mode
  ),
}, {
  snippet({ trig = "__", regTrig = false, wordTrig = false }, fmta([[_{<>}]], { i(1) }), math_mode),
  snippet({ trig = [[%^%^]], regTrig = false, wordTrig = false }, fmta([[^{<>}]], { i(1) }), math_mode),

  snippet(",,", fmta([[\,]], {}), math_mode),
  snippet(";;", fmta([[\;]], {}), math_mode),
  snippet("==", fmta([[&=]], {}), math_mode),

  postfix(
    { trig = "./", name = "fraction", priority = 2000, match_pattern = "%b()$" },
    fmta([[\frac{<>}{<>}]], { l(l.POSTFIX_MATCH:sub(2, -2)), i(1) }),
    math_mode
  ),

  snippet("lrb", fmta([[\left\{ <> \right\}]], vi(1)), math_mode),
  snippet("lrp", fmta([[\left( <> \right)]], vi(1)), math_mode),
  snippet("lrs", fmta("\\left[ <> \\right]", vi(1)), math_mode),
  snippet("lra", fmta([[\left\langle <> \right\rangle]], vi(1)), math_mode),
}
