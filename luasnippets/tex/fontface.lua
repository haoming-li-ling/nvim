local font_table = {
  fk = { "mathfrak" },
  -- sf = { "mathsf", "symbsf" },
  -- tsf = { "textsf" },
  sf = { "textsf", both = true },
  rm = { "mathrm", "symup" },
  it = { "mathit", "symit" },
  tit = { "textit" },
  bb = { "mathbb" },
  bf = { "mathbf", "symbf" },
  tbf = { "textbf" },
  cal = { "mathcal" },
  scr = { "mathscr" },
  te = { "text" },
  op = { "operatorname" },
  -- al = { "acrlong", both = true },
}
local snips = {}

for k, v in pairs(font_table) do
  local long, short = unpack(v)
  local long_fmt = [[\]] .. long .. [[{<>}]]
  local mode = math_mode
  if v.text then
    mode = text_mode
  end
  if v.both then
    mode = nil
  end
  snips[#snips + 1] = snippet({ trig = k .. "(%w*)", regTrig = true }, {
    d(1, function(_, snip)
      if snip.captures[1] == "" then
        return sn(nil, fmta(long_fmt, i(1)))
      elseif short and #snip.captures[1] == 1 then
        local short_fmt = [[\]] .. short .. [[{<>}]]
        return sn(nil, fmta(short_fmt, { l(l.CAPTURE1) }))
      else
        return sn(nil, fmta(long_fmt, { l(l.CAPTURE1) }))
      end
    end),
  }, mode)
end

return snips
