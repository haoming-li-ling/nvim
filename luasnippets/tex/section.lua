local function sec_label(ind_self, ind_target)
  return cp(ind_self, ind_target, function(s)
    local lowered = s:gsub("\\%a*%b[](%b{})", function(a)
      return a:sub(2, -2)
    end)
      :gsub("\\%a*{", "")
      :gsub("\\(%a*[^{])", "%1")
      :gsub("[A-Z]", string.lower)
      :gsub("[/,.?!'\":;&$}{%[%]\\@+=`~<>#%%%^%*%(%)_]", "")
      :gsub("[ %-]", "-")
    return lowered
  end)
end

local sec_table = {
  par = { "paragraph", "par" },
  cha = { "chapter", "cha" },
  part = { "part", "prt" },
  sec = { "section", "sec" },
  sub = { "subsection", "sub" },
  ssub = { "subsubsection", "ssub" },
}

local snip_table = {}

for k, v in pairs(sec_table) do
  snip_table[#snip_table + 1] = snippet(
    { trig = "^" .. k .. "(%*?)", regTrig = true },
    fmta(
      string.format(
        [[
  \%s<><>{<>}
  \label{%s:<>}
  <>]],
        v[1],
        v[2]
      ),
      {
        l(l.CAPTURE1),
        d(2, function(args)
          if args[1][1]:find("\\%(") or args[1][1]:find("%$") then
            return sn(nil, { t("["), i(1), t("]") })
          else
            return sn(nil, t(""))
          end
        end, 1),
        ci(1),
        sec_label(3, 1),
        i(0),
      }
    ),
    text_mode
  )
end

return snip_table
