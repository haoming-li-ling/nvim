local nog = "nog"

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
  --   snippet(
  --     "lxg",
  --     fmt(
  --       [[
  -- \ex. \gll <> \\
  --           <> \\
  --      \glt `<>'
  -- <>
  -- ]],
  --       { i(1), i(2), i(3), i(0) },
  --       angle_brack
  --     ),
  --     text_mode
  --   ),

  --   snippet(
  --     "lag",
  --     fmt(
  --       [[
  -- \a. \gll <> \\
  --          <> \\
  --     \glt `<>'
  -- <>
  -- ]],
  --       { i(1), i(2), i(3), i(0) },
  --       angle_brack
  --     ),
  --     text_mode
  --   ),
  -- snippet(
  --   "plab",
  --   fmt([[\phantomsection\label{itm:<>}\hskip0pt]], {
  --     vi(1, "label"),
  --   }, angle_brack),
  --   text_mode
  -- ),
  -- snippet(
  --   "alab",
  --   fmt([[\phantomsection\label{itm:<>} ]], {
  --     vi(1, "label"),
  --   }, angle_brack),
  --   text_mode
  -- ),
  -- snippet(
  --   {
  --     trig = "^(%s*\\p?ex[^%.]*)lab",
  --     regTrig = true,
  --     priority = 1000,
  --     name = "lab",
  --   },
  --   fmt(
  --     [[<>\phantomsection\label{itm:<>}\hskip0pt]],
  --     { leading_white(), i(1, "label") },
  --     angle_brack
  --   ),
  --   text_mode
  -- ),
  -- snippet(
  --   {
  --     trig = "^(%s*\\a[^%.]*)lab",
  --     regTrig = true,
  --     priority = 1000,
  --     name = "lab",
  --   },
  --   fmt(
  --     [[<>\phantomsection\label{itm:<>}]],
  --     { leading_white(), i(1, "label") },
  --     angle_brack
  --   ),
  --   text_mode
  -- ),
  -- snippet("pref", fmt([[(\ref{itm<>})]], { i(1) }, angle_brack), text_mode),
  snippet("glprn", fmta([[\glpreamble <> \endpreamble]], { i(1, "preamble") }), text_mode),
  snippet("glpr", fmta([[\glpreamble <> //]], { i(1, "preamble") }), text_mode),
  -- snippet(
  --   { trig = "^exn", regTrig = true },
  --   fmt(
  --     [[
  --       \ex<><><>
  --         <>
  --       \xe
  --     ]],
  --     {
  --       tg("[", 1),
  --       i(1, "glstyle=nlevel"),
  --       tg("]", 1),
  --       -- i(2, "text"),
  --       gln(2),
  --     },
  --     angle_brack
  --   ),
  --   text_mode
  -- ),
  -- snippet(
  --   { trig = "^(%*?)pex", regTrig = true },
  --   fmt(
  --     [[
  --       \pex<><><><><> <>
  --         \a <><>
  --       \xe
  --     ]],
  --     {
  --       tg("[", 1),
  --       f(escape_char(1)),
  --       f(function(_, snip)
  --         if #escape_char(1)(_, snip) == 0 then
  --           return ""
  --         else
  --           return ", "
  --         end
  --       end),
  --       i(1, "nopreamble"),
  --       tg("]", 1),
  --       i(2),
  --       i(3),
  --       d(4, rec_ex),
  --     },
  --     angle_brack
  --   ),
  --   text_mode
  -- ),
  -- snippet(
  --   { trig = "^pexn", regTrig = true },
  --   fmt(
  --     [[
  --       \pex<><><> <>
  --         \a <><>
  --       \xe
  --     ]],
  --     {
  --       tg("[", 1),
  --       i(1, "glstyle=nlevel"),
  --       tg("]", 1),
  --       i(2),
  --       gln(3, "$PARENT_INDENT  "),
  --       d(4, rec_exn),
  --     },
  --     angle_brack
  --   ),
  --   text_mode
  -- ),
  snippet(
    { trig = "gl", regTrig = false },
    fmta(
      [[
\begingl
  \gla <> //
  \glb <> //
  \glft `<>' //
\endgl]],
      {
        vi(1, "text"),
        vi(2, "gloss"),
        vi(3, "translation"),
      }
    ),
    text_mode
  ),
  snippet(
    { trig = "glp", regTrig = false },
    fmta(
      [[\begingl
  \glpreamble <> //
  \gla <> //
  \glb <> //
  \glft `<>' //
\endgl]],
      {
        vi(1, "preamble"),
        vi(2, "text"),
        vi(3, "gloss"),
        vi(4, "translation"),
      }
    ),
    text_mode
  ),
  snippet("gln", gln(1, "$PARENT_INDENT"), text_mode),
  snippet(
    { trig = "glpn", regTrig = false },
    fmta(
      [[\begingl
  \glpreamble <> \endpreamble
    <>[<>]<>
  \glft `<>'
\endgl]],
      {
        i(1, "preamble"),
        i(2, "word"),
        i(3, "gloss"),
        d(4, rec_gln),
        i(5, "translation"),
      }
    ),
    text_mode
  ),
  snippet("ng", fmta([[\<>{<>}]], { t(nog), i(1, "[") }), text_mode),
  snippet("ngs", fmta([[\<>{[}]], { t(nog) }), text_mode),
  snippet("ngb", fmta([[\<>{\{}]], { t(nog) }), text_mode),
  -- snippet(
  --   "lx",
  --   fmt([[(\lastx<><>)]], { tg(" ", 1), i(1, "a") }, angle_brack),
  --   text_mode
  -- ),
  -- snippet(
  --   "nx",
  --   fmt([[(\nextx<><>)]], { tg(" ", 1), i(1, "a") }, angle_brack),
  --   text_mode
  -- ),
  snippet("lj", fmta([[\ljudge{<>}]], { i(1, "*") }), text_mode),
  snippet("*", fmta([[\ljudge{<>}]], { t("*") }), text_mode),
  snippet("?", fmta([[\ljudge{<>}]], { t("?") }), text_mode),
  snippet("#", fmta([[\ljudge{<>}]], { t("\\#") }), text_mode),
  snippet("%", fmta([[\ljudge{<>}]], { t("\\%") }), text_mode),
  snippet("ng/", fmta([[@ \<>{/} @]], { t(nog) }), text_mode),
  snippet("ngss", fmta([[\<>{[} @ <> @ \<>{]}<>]], { t(nog), vi(1), t(nog), i(0) }), text_mode),
  snippet("ngpp", fmta([[\<>{(} @ <> @ \<>{)}<>]], { t(nog), vi(1), t(nog), i(0) }), text_mode),
  snippet("ngbb", fmta([[\<>{\{} @ <> @ \<>{\}}<>]], { t(nog), vi(1), t(nog), i(0) }), text_mode),
  snippet("ng*p", fmta([[\<>{*(} @ <> @ \<>{)}<>]], { t(nog), vi(1), t(nog), i(0) }), text_mode),
  snippet("ngp*", fmta([[\<>{(*} @ <> @ \<>{)}<>]], { t(nog), vi(1), t(nog), i(0) }), text_mode),
  snippet("ngbk", fmta([[\<>{\I{[}<> {} } @ <> @ \<>{]}<>]], { t(nog), i(1), i(2), t(nog), i(3) }), text_mode),
  snippet("nglab", fmta([[\<>{\lab{<>} } @ <> @ \<>{]}<>]], { t(nog), i(1), i(2), t(nog), i(3) }), text_mode),
  snippet("gap", fmta([[\<>{\gap{<>}}<>]], { t(nog), i(1), i(2) }), text_mode),

  snippet("gj", fmta([[\<>{\ljudge<>} @ ]], { t(nog), i(1, "*") }), text_mode),
  snippet("g*", fmta([[\<>{\ljudge{<>}} @ ]], { t(nog), i(1, "*") }), text_mode),
  snippet("g?", fmta([[\<>{\ljudge{<>}} @ ]], { t(nog), i(1, "?") }), text_mode),
  snippet("bk", fmta([[\I{[}<>]], { i(0) }), text_mode),
}, {
  snippet("pgap", { t("parasitic gap") }, text_mode),
  -- snippet(
  --   { trig = "^gx", regTrig = true },
  --   fmt(
  --     [[
  --       \ex
  --         \begingl
  --           \gla <> //
  --           \glb <> //
  --           \glft `<>' //
  --         \endgl
  --       \xe ]],
  --     { i(1, "text"), i(2, "gloss"), i(0, "translation") },
  --     angle_brack
  --   ),
  --   text_mode
  -- ),
  -- snippet(
  --   { trig = "^([%?%*%%#])gx", regTrig = true },
  --   fmt(
  --     [[
  --       \ex
  --         \begingl
  --           \gla \nogloss{\ljudge{<>}} @ <> //
  --           \glb <> //
  --           \glft `<>' //
  --         \endgl
  --       \xe
  --       ]],
  --     { f(escape_char(1)), i(1, "text"), i(2, "gloss"), i(0, "translation") },
  --     angle_brack
  --   ),
  --   text_mode
  -- ),
  -- snippet(
  --   { trig = "^(%s+)a", regTrig = true },
  --   fmt(
  --     [[
  --       <>\a <>
  --     ]],
  --     {
  --       leading_white(),
  --       i(0),
  --       -- vi(0, "text"),
  --     },
  --     angle_brack
  --   ),
  --   text_mode
  -- ),
  -- snippet(
  --   { trig = "^(%s*)([%?%*%%#])a", regTrig = true },
  --   fmt([[<>\a \ljudge{<>} <> ]], {
  --     leading_white(),
  --     f(escape_char(2)),
  --     i(0),
  --   }, angle_brack),
  --   text_mode
  -- ),
  -- snippet(
  --   { trig = "^(%s*)ga", regTrig = true },
  --   fmt(
  --     [[
  --       <>\a \begingl
  --           \gla <> //
  --           \glb <> //
  --           \glft `<>' //
  --         \endgl
  --       ]],
  --     {
  --       leading_white(),
  --       i(1, "text"),
  --       i(2, "gloss"),
  --       i(0, "translation"),
  --     },
  --     angle_brack
  --   ),
  --   text_mode
  -- ),
  -- snippet(
  --   { trig = "^(%s*)([%?%*%%#])ga", regTrig = true },
  --   fmt(
  --     [[
  --       <>\a \begingl
  --           \gla \nogloss{\ljudge{<>}} @ <> //
  --           \glb <> //
  --           \glft `<>' //
  --         \endgl
  --       ]],
  --     {
  --       leading_white(),
  --       f(escape_char(2)),
  --       i(1, "text"),
  --       i(2, "gloss"),
  --       i(0, "translation"),
  --     },
  --     angle_brack
  --   ),
  --   text_mode
  -- ),
  -- snippet(
  --   { trig = "^%*px", regTrig = true },
  --   fmt(
  --     [[
  --     \pex[*, nopreamble]
  --       <>
  --     \xe
  --     ]],
  --     { i(0) },
  --     angle_brack
  --   ),
  --   text_mode
  -- ),
  -- snippet(
  --   { trig = "^px", regTrig = true },
  --   fmt(
  --     [[
  --     \pex[nopreamble]
  --       <>
  --     \xe
  --     ]],
  --     { i(0) },
  --     angle_brack
  --   ),
  --   text_mode
  -- ),
  -- snippet(
  --   { trig = "^x", regTrig = true },
  --   fmt(
  --     [[
  --   \ex
  --     <>
  --   \xe
  --   ]],
  --     { i(0) },
  --     angle_brack
  --   ),
  --   text_mode
  -- ),
  -- snippet(
  --   { trig = "^([%?%*%%#])x", regTrig = true },
  --   fmt(
  --     [[
  --     \ex
  --       \ljudge{<>} <>
  --     \xe
  --     ]],
  --     { f(escape_char(1)), i(0) },
  --     angle_brack
  --   ),
  --   text_mode
  -- ),
}
