local escape_char = function(index)
  return function(_, snip)
    local char = snip.captures[index]
    if char == "%" or char == "#" then
      return "\\" .. char
    else
      return char
    end
  end
end

return {
  snippet({ trig = ",l([ablr][lr]?)", regTrig = true, wordTrig = false }, {
    d(1, function(_, snip)
      if snip.captures[1]:find("[lr][lr]") then
        return sn(nil, t(",l" .. snip.captures[1]))
      else
        return sn(
          nil,
          fmta([[, label={<>: \(<>\)}]], {
            f(function(_, _)
              local pos_table = {
                l = "left",
                r = "right",
                a = "above",
                b = "below",
              }
              setmetatable(pos_table, {
                __index = function()
                  return ""
                end,
              })
              local position = snip.captures[1]
              local space = position:find("..") and " " or ""
              return pos_table[position:sub(1, 1)] .. space .. pos_table[position:sub(2, 2)]
            end),
            i(1),
          })
        )
      end
    end),
  }),

  snippet(
    { trig = "useforest", regTrig = true },
    fmta(
      [[
\usepackage[linguistics]{forest}

\tikzset{every label/.style={font=\footnotesize}}

\forestset{
  great empty nodes/.style={
    for tree={
      calign=fixed edge angles,
      calign primary angle=-60,
    calign secondary angle=60},
    delay={
      where content={}{
        shape=coordinate,
    for current and siblings={anchor=north}}{}}
  },
  downroof/.style={
    for children={
      if n=1{
        edge path'={
          (.parent first) -- (!u.parent anchor) -- (!ul.parent last) -- cycle
        }
      }{no edge}
    }
  }
}
]],
      {}
    ),
    text_mode
  ),

  snippet(
    { trig = "^(%s*)fot", name = "forest", regTrig = true },
    fmta(
      [[
        <>\begin{forest}
        <>  for tree={fit=tight}
        <>  <>
        <>\end{forest}
      ]],
      {
        leading_white(),
        leading_white(),
        leading_white(),
        i(1),
        leading_white(),
      },
      { delimiters = "<>" }
    ),
    text_mode
  ),
  snippet(
    { trig = "^(%s*)fo", name = "forest", regTrig = true },
    fmta(
      [[
        <>\begin{forest}
        <>  for tree={fit=rectangle}
        <>  <>
        <>\end{forest}
      ]],
      {
        leading_white(),
        leading_white(),
        leading_white(),
        i(0),
        leading_white(),
      },
      { delimiters = "<>" }
    ),
    text_mode
  ),
  snippet(
    { trig = "^(%s*)fog", name = "forest", regTrig = true },
    fmta(
      [[
        <>\begin{forest}
        <>  great empty nodes
        <>  <>
        <>\end{forest}
      ]],
      {
        leading_white(),
        leading_white(),
        leading_white(),
        i(0),
        leading_white(),
      },
      { delimiters = "<>" }
    ),
    text_mode
  ),
  snippet(
    { trig = "^cp", name = "CP", regTrig = true },
    fmta(
      [[
        \begin{forest}{}
          [CP
            [DP\\<>]
            [C\('\) 
              [C\\<>] 
              [TP 
                [DP\\<>]
                [T\('\)
                  [T\\<>]
                  <>
                ]
              ]
            ]
          ]
        \end{forest}
        <>
      ]],
      {
        i(1, "SpecCP"),
        i(2, "C"),
        i(3, "SpecTP"),
        i(4, "T"),
        c(5, {
          t("[\\ldots]"),
          sn(
            nil,
            fmta(
              [[[\emph{v}P
            [DP\\<>]
            [\emph{v}\('\)
              [\emph{v}\\<>]
              [VP
                [V\\<>]
                [DP\\<>]
              ]
            ]
          ]
          ]],
              {
                i(1, "SpecvP"),
                i(2, "v"),
                i(3, "V"),
                i(4, "Obj"),
              },
              { dedent = false }
            )
          ),
        }),
        i(0),
      }
    ),
    text_mode
  ),
}
