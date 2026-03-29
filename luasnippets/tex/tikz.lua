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
  snippet("draw", fmta([[\draw[<>] (<>) <> (<>);]], { i(1), i(2), i(3), i(4) })),
  snippet("arrow", fmta([[\draw[-Stealth, <>] (<>) <> (<>);]], { i(1), i(2), i(3), i(4) })),
  snippet("|->", fmta([=[\draw[-Stealth] (<>) -- ++(0, <>) -| (<>);]=], { i(1), i(2, "-.5"), i(3) })),
  snippet("node", fmta([[node [pos=<>] (<>) {<>}]], { i(1, ".5"), i(2), i(3) })),
  snippet("controls", fmta([[.. controls ++(<>, <>) and ++(<>, <>) ..]], { i(1), i(2), i(3), i(4) })),
  snippet(
    "move",
    fmta([=[\draw[-Stealth] (<>) .. controls (<>, <>) and (<>, <>) .. (<>);]=], { i(1), i(2), i(3), i(4), i(5), i(6) })
  ),
  snippet(
    "agree",
    fmta(
      [=[\draw[-Stealth, dotted] (<>) .. controls (<>, <>) and (<>, <>) .. (<>);]=],
      { i(1), i(2), i(3), i(4), i(5), i(6) }
    )
  ),
  snippet("mark", fmta([[\tikzmarknode{<>}{<>}]], { i(1), i(2) })),
  snippet(
    "overlay",
    fmta(
      [=[
  \begin{tikzpicture}[overlay, remember picture]
    <>
  \end{tikzpicture}
  ]=],
      { i(1) }
    )
  ),
}
