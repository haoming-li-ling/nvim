return {
  snippet(
    "sniptitle",
    fmta([[{ trig = "<>", regTrig = <>, priority = <> }]], {
      i(1, "trig"),
      i(2, "true"),
      i(3, "1000"),
    })
  ),

  snippet(
    "sniptemp",
    fmta(
      [[
        local ls = require("luasnip")
        local snippet = ls.snippet
        local sn = ls.snippet_node
        local isn = ls.indent_snippet_node
        local t = ls.text_node
        local i = ls.insert_node
        local f = ls.function_node
        local c = ls.choice_node
        local d = ls.dynamic_node
        local r = ls.restore_node
        local events = require("luasnip.util.events")
        local ai = require("luasnip.nodes.absolute_indexer")
        local fmt = require("luasnip.extras.fmt").fmt
        local m = require("luasnip.extras").m
        local l = require("luasnip.extras").l
        local rep = require("luasnip.extras").rep
        local postfix = require("luasnip.extras.postfix").postfix
        
        local util = require("hl.editing.luasnip-util")
        local angle_brack = util.angle_brack
        local tg = util.tg
        local cp = util.cp
        local su = util.su
        local o = util.o
        local vi = util.vi
        <>
      ]],
      { i(0) }
    )
  ),

  snippet(
    "fmt",
    fmta(
      [=[
        snippet(<>, fmta([[<>]], { <> })<><>),
        <>
      ]=],
      {
        c(1, {
          sn(nil, fmta([["<>"]], r(1, "trig"))),
          sn(
            nil,
            fmta([[{ trig = "<>", regTrig = <> }]], {
              r(1, "trig"),
              i(2, "true"),
            })
          ),
          sn(
            nil,
            fmta([[{ trig = "<>", regTrig = <>, wordTrig = <>, priority = <>, name = "<>" }]], {
              r(1, "trig"),
              i(2, "true"),
              i(3, "false"),
              i(4, "1000"),
              cp(5, 1),
            })
          ),
        }),
        i(2, "string"),
        i(3, "i(1)"),
        -- tg(", ", 4),
        -- i(4),
        tg(", ", 4),
        i(4, "math_mode"),
        i(0),
      }
    ),
    { stored = { trig = i(nil, "trig") } }
  ),

  snippet(
    { trig = "^(%s*)snip", regTrig = true },
    fmta(
      [[<>snippet("<>", { <> }<><>),
    <>]],
      {
        f(function(_, snip)
          return snip.snippet.captures[1]
        end),
        i(1, "trig"),
        i(2, "nodes"),
        tg(", ", 3),
        i(3, "snippet_cond"),
        i(0),
      }
    )
  ),

  snippet(
    "lcmd",
    fmta(
      [[
        snippet("<>", { t("\\<>{"), i(1, "arg"), t("}") }<><>),
        <>
      ]],
      {
        i(1, "trig"),
        i(2, "cmd"),
        i(3, "snippet_cond"),
        tg(", ", 3),
        i(0),
      }
    )
  ),
}
