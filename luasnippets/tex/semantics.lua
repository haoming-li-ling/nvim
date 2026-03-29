local function gen_type(var)
  local type_table = {
    x = "e",
    y = "e",
    z = "e",
    f = "et",
    g = "et",
    P = "et",
    Q = "et",
    d = "d",
    D = "dt",
    p = "st",
    q = "st",
    get = function(table, k)
      local type = table[k]
      if type then
        return type, 1
      else
        return "type", 1
      end
    end,
  }
  local type, index = type_table:get(var)
  return i(index, type)
end

local gen_op = {
  e = "exists",
  v = "forall",
  f = "forall",
  l = "lambda",
  i = "iota",
}

local function dif(index, bool, node1, node2)
  return d(index, function(_, _)
    if bool then
      return node1
    elseif node2 then
      return node2
    else
      return sn(nil, t(""))
    end
  end)
end

return {

  snippet("type", fmta([[\langle <>, <> \rangle]], { i(1, "e"), i(2, "t") }), math_mode),
  snippet({
    trig = "([ivelf]{2})([a-zA-Z]'*)([tcp]*)",
    trigEngine = "ecma",
    priority = 10000,
  }, {
    d(1, function(_, snip)
      local pre, var, type_cond_pre = unpack(snip.captures)
      local op_abb = pre:sub(1, 1)
      return sn(
        nil,
        fmta([[\<> <><><><>.\, ]], {
          t(gen_op[op_abb]),
          t(var),
          dif(1, type_cond_pre:find("t"), sn(nil, { t("_{"), gen_type(var), t("}") })),
          dif(2, type_cond_pre:find("c"), sn(nil, { i(1, [[ \in ]]), i(2) })),
          dif(3, type_cond_pre:find("p"), sn(nil, fmta([[ : <>]], i(1), { dedent = false }))),
        })
      )
    end),
  }, math_mode),
  -- snippet(
  --   { trig = "([ivel]{2,3})([a-zA-Z]'*)(t?)(c?)", trigEngine = "ecma" },
  --   {
  --     d(1, function(_, snip)
  --       local pre, var, type, cond = unpack(snip.captures)
  --       local op_abb, presup = pre:sub(1, 1), #pre == 3
  --       return sn(
  --         nil,
  --         fmta([[\<> <><><><>.\, ]], {
  --           t(gen_op[op_abb]),
  --           t(var),
  --           dif(1, type == "t", sn(nil, { t("_{"), gen_type(var), t("}") })),
  --           dif(2, cond == "c", sn(nil, { i(1, [[ \in ]]), i(2) })),
  --           dif(3, presup, sn(nil, fmta([[ : <>]], i(1), { dedent = false }))),
  --         })
  --       )
  --     end),
  --   },
  --   math_mode
  -- ),

  -- snippet(
  --   { trig = "([vel])([vel])([vel]?)(t?)([a-zA-Z]'*)", regTrig = true },
  --   {
  --     d(1, function(_, snip)
  --       local c1, c2, c3, c4, c5 = unpack(snip.captures)
  --       if c1 ~= c2 or (c3 ~= "" and c2 ~= c3) then
  --         return sn(nil, t(snip.trigger))
  --       else
  --         return sn(
  --           nil,
  --           fmta([[\<> <><><>.\, ]], {
  --             f(function(_, _) return op_abbr[c1] end),
  --             t(c5),
  --             d(1, function(_, _)
  --               if c4 == "t" then
  --                 return sn(nil, { t("_{"), gen_type(c5), t("}") })
  --               else
  --                 return sn(nil, t(""))
  --               end
  --             end),
  --             d(2, function(_, _)
  --               if c3 ~= "" then
  --                 return sn(
  --                   nil,
  --                   fmta(
  --                     [[ : <>]],
  --                     i(1),
  --                     { trim_empty = false, dedent = false }
  --                   )
  --                 )
  --               else
  --                 return sn(nil, t(""))
  --               end
  --             end),
  --           })
  --         )
  --       end
  --     end),
  --   },
  --   math_mode
  -- ),

  -- snippet("sm", fmta([[\llbracket <> \rrbracket]], { i(1) }), math_mode),
  -- snippet("sem", fmta([[\llbracket \text{<>} \rrbracket]], { i(1, "text") }), math_mode),
  snippet("sm", fmta([[\sem{<>}]], { vi(1) }), math_mode),
  snippet("sem", fmta([[\sem{\text{<>}}]], { vi(1, "text") }), math_mode),
  snippet("semf", fmta([[\llbracket \text{<>} \rrbracket^{f}]], { vi(1) }), math_mode),
  snippet("semo", fmta([[\llbracket \text{<>} \rrbracket^{o}]], { vi(1) }), math_mode),
  snippet("smf", fmta([[\llbracket <> \rrbracket^{f}]], { vi(1) }), math_mode),
  snippet("smo", fmta([[\llbracket <> \rrbracket^{o}]], { vi(1) }), math_mode),
  snippet("seM", fmta([[\llbracket \text{<>} \rrbracket^{\mathcal{M}}]], { vi(1, "text") }), math_mode),
  snippet("seMg", fmta([[\llbracket \text{<>} \rrbracket^{\mathcal{M}, g}]], { vi(1, "text") }), math_mode),
  snippet(
    "smfog",
    fmta(
      [[
  \sem*{ 
    \begin{gathered}
      \begin{forest}
        great empty nodes,
        <>
      \end{forest}
    \end{gathered}
  }]],
      { i(1) }
    ),
    math_mode
  ),

  snippet(
    { trig = "(l?l?)s(e?)(w'*)(t?'*)(g?)", regTrig = true },
    fmta([[<>\llbracket <> \rrbracket^{<>, <>}]], {
      f(function(_, snip)
        if snip.captures[1] == "ll" then
          if #snip.captures[4] == 0 then
            return string.format("\\lambda %s.\\, ", snip.captures[3])
          else
            return string.format("\\lambda \\langle %s, %s \\rangle.\\, ", snip.captures[3], snip.captures[4])
          end
        else
          return ""
        end
      end),
      d(1, function(_, snip)
        if snip.captures[2] == "e" then
          return sn(nil, fmta([[\text{<>}]], i(1)))
        else
          return sn(nil, i(1))
        end
      end),
      f(function(_, snip)
        if #snip.captures[4] == 0 then
          return snip.captures[3]
        else
          return string.format("\\langle %s, %s \\rangle", snip.captures[3], snip.captures[4])
        end
      end),
      d(2, function(_, snip)
        if snip.captures[5] == "g" then
          return sn(1, { i(1, "g") })
        else
          return sn(nil, t("g"))
        end
      end),
    }),
    math_mode
  ),
}
