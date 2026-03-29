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
  --@gloss
  snippet({ trig = "'", wordTrig = false }, fmta([[\('\)]], {}), text_mode),

  snippet("phs", fmta([[\phantom{[}]], {}), text_mode),
  snippet("phb", fmta([[\phantom{\{}]], {}), text_mode),
  snippet("php", fmta([[\phantom{(}]], {}), text_mode),
  snippet("ph*p", fmta([[\phantom{*(}]], {}), text_mode),
  snippet("ph(*", fmta([[\phantom{(*}]], {}), text_mode),

  --@features
  snippet(
    { trig = "([%-%+])(%w*)", regTrig = true },
    fmta([[<><>]], {
      l(l.CAPTURE1),
      l([[\mathrm{]] .. l.CAPTURE2 .. [[}]]),
    }),
    math_mode
  ),

  snippet("wh", fmta([[\emph{wh}]], {}), text_mode),
  snippet("vP", fmta([[\textit{v}P]], {}), text_mode),

  --@labels
  snippet(
    { trig = "([^%[])lab", regTrig = true },
    fmta([[<>\label{ex:<>}]], {
      l(l.CAPTURE1),
      i(1),
    }),
    text_mode
  ),

  --@brackected, @labeled
  snippet({ trig = "cp" }, { t([[\(_{\text{CP}}\) ]]) }, text_mode),
  snippet({ trig = "dp" }, { t([[\(_{\text{DP}}\) ]]) }, text_mode),
  snippet({ trig = "tp" }, { t([[\(_{\text{TP}}\) ]]) }, text_mode),
  snippet({ trig = "vp" }, { t([[\(_{\text{\textit{v}P}}\) ]]) }, text_mode),
  snippet({ trig = "Vp" }, { t([[\(_{\text{VP}}\) ]]) }, text_mode),
  snippet({ trig = "VP" }, { t([[\(_{\text{VP}}\) ]]) }, text_mode),
  snippet(
    { trig = "[lab", wordTrig = false, priority = 900 },
    { t("[\\(_{\\text{"), i(1, "DP"), t("}}\\) ") },
    text_mode
  ),
  --@indices, @index
  snippet({
    trig = "([ijkxyz]{2}|[1-9])",
    trigEngine = "ecma",
    wordTrig = false,
    priority = 900,
  }, fmta([[\(_<>\)]], { l((l.CAPTURE1):sub(1, 1)) }), text_mode),

  snippet("t", { t([[\(t\)]]) }, text_mode),
  snippet({ trig = "t([1-9i-kx-z])", regTrig = true }, fmta([[\(t_<>\)]], { l(l.CAPTURE1) }), text_mode),
}
