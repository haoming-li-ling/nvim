local gloss_str = [[
\gll 
<> \\
<> \\
\glt <>`<>'
<>
  ]]

local function gloss(snip)
  return sn(
    nil,
    fmta(gloss_str, {
      i(1),
      i(2),
      f(function()
        if snip.captures[3]:find("%*") then
          return "Intended: "
        else
          return ""
        end
      end),
      i(3),
      i(0),
    })
  )
end

return {

  snippet(
    { trig = "([abx])(g?)([%*%?#%%]*)", regTrig = true },
    fmta([[\<>. <><>]], {
      l(l.CAPTURE1:gsub("x", "ex")),
      l(l.CAPTURE3:gsub([[%%]], [[\%%]]):gsub([[#]], [[\#]]):gsub("(.)$", "%1 ")),
      d(1, function(_, snip)
        if snip.captures[2] == "g" then
          return gloss(snip)
        else
          return sn(nil, i(0))
        end
      end),
    }),
    text_mode
  ),
}
