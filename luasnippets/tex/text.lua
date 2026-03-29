local colors = { "red", "orange", "blue", "green", "pink" }

local color_snips = {}

local function tc(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

for _, v in ipairs(colors) do
  color_snips[#color_snips + 1] = snippet(v, fmta(string.format([[\textcolor{%s}{<>}]], v), i(1)))
end

return {
  unpack(color_snips),
  snippet(
    "usepara",
    fmta(
      [[
\usepackage{paracol}
\footnotelayout{m}
\globalcounter{ExNo}]],
      {}
    )
  ),
  snippet(
    "useref",
    fmta(
      [[
\usepackage[hidelinks]{hyperref}
\usepackage{cleveref}
\crefname{ExNo}{}{}
\crefname{SubExNo}{}{}
\renewcommand{\theExNo}{\arabic{ExNo}}
\renewcommand{\theSubExNo}{\theExNo\alph{SubExNo}}
\creflabelformat{SubExNo}{(#2#1#3)}
\creflabelformat{ExNo}{(#2#1#3)}
\crefrangelabelformat{SubExNo}{(#3#1#4--#5\crefstripprefix{#1}{#2}#6)}
\crefrangelabelformat{ExNo}{(#3#1#4)--(#5#2#6)}
  ]],
      {}
    )
  ),

  snippet("ph", fmta([[\phantom{<>}]], { i(1) })),
  snippet(
    "paracol",
    fmta(
      [[
  \begin{paracol}{<>}
    <>
    \switchcolumn
    <>
  \end{paracol}]],
      { i(1, "2"), i(2), i(3) }
    ),
    text_mode
  ),
  snippet(
    "lorem",
    fmta(
      [[Lorem ipsum dolor sit amet, officia excepteur ex fugiat reprehenderit enim labore culpa sint ad nisi Lorem pariatur mollit ex esse exercitation amet. Nisi anim cupidatat excepteur officia. Reprehenderit nostrud nostrud ipsum Lorem est aliquip amet voluptate voluptate dolor minim nulla est proident. Nostrud officia pariatur ut officia. Sit irure elit esse ea nulla sunt ex occaecat reprehenderit commodo officia dolor Lorem duis laboris cupidatat officia voluptate. Culpa proident adipisicing id nulla nisi laboris ex in Lorem sunt duis officia eiusmod. Aliqua reprehenderit commodo ex non excepteur duis sunt velit enim. Voluptate laboris sint cupidatat ullamco ut ea consectetur et est culpa et culpa duis.]],
      {}
    )
  ),

  snippet(
    "beg",
    fmta(
      [[
  \begin{<>}
  <>
  \end{<>}
  ]],
      { i(1, "env"), vi(2), rep(1) }
    )
  ),

  snippet(
    { trig = "^fig", regTrig = true },
    fmta(
      [[
        \begin{figure}[<>]
          \centering
          \includegraphics[width=<>\linewidth]{<>}
          \caption{<>}
          \label{fig:<>}
        \end{figure}
      ]],
      {
        i(1, "htpb"),
        i(2, "0.8"),
        i(3, "img.jpg"),
        i(4, "caption"),
        i(5, "label"),
      }
    ),
    text_mode
  ),

  -- snippet("im", { t("\\item") }, {
  --   condition = text_mode.condition,
  --   show_condition = text_mode.show_condition,
  --   callbacks = {
  --     [1] = {
  --       [events.enter] = function(node, _)
  --         vim.notify("1")
  --         vim.cmd(tc([[normal ==]]))
  --       end,
  --       [events.leave] = function(node, _)
  --         vim.notify("1")
  --         vim.cmd(tc([[normal ==]]))
  --       end,
  --     },
  --   },
  -- }),

  snippet(
    {
      trig = "^pac",
      regTrig = true,
      docTrig = "pac",
      name = "pac",
      dscr = "pac",
    },
    -- fmta([[\usepackage{<>}]], { i(0) }),
    fmta([[\usepackage<><><>{<>}<>]], {
      tg("[", 1),
      i(1),
      tg("]", 1),
      i(2),
      i(0),
    }),
    text_mode
  ),

  snippet("em", fmta([[\emph{<>}]], vi(1)), text_mode),
  snippet("bf", fmta([[\textbf{<>}]], vi(1)), text_mode),
  snippet("ul", fmta([[\myuline{<>}]], vi(1)), text_mode),
  snippet("un", fmta([[\underline{<>}]], vi(1)), text_mode),
  snippet("it", fmta([[\textit{<>}]], vi(1)), text_mode),
  snippet("tt", fmta([[\texttt{<>}]], vi(1))),
  snippet("sc", fmta([[\textsc{<>}]], vi(1))),
  snippet("sl", fmta([[\textsl{<>}]], vi(1)), text_mode),

  snippet("ilab", fmta([[\label{itm:<>}]], i(1, "label")), text_mode),
  snippet("ref", fmta([[\ref{<>}]], { i(1) })),
  snippet("cref", fmta([[\cref{<>}]], { i(1) })),
  snippet("crefr", fmta([[\crefrange{<>}{<>}]], { i(1), i(2) })),

  snippet(
    "font",
    fmta(
      [[
        \setmainfont{<>}
        \setmathfont{<>}
      ]],
      {
        i(1, "TeX Gyre Pagella"),
        cp(2, 1, su("", " Math")),
      }
    ),
    text_mode
  ),
  snippet(
    "ipafont",
    fmta(
      [[
        \setmainfont{<>}
        \setmathfont{<>}
      ]],
      {
        t("Doulos SIL"),
        -- cp(2, 1, su("", " Math")),
        t("TeX Gyre Termes Math"),
      }
    ),
    text_mode
  ),
  snippet({ trig = "mm", wordTrig = false }, fmta([[\(<>\)]], { i(1) }), text_mode),
}, {
  -- snippet({ trig = "im ", regTrig = false }, fmta([[\item ]], {}), text_mode),

  snippet("im ", { t("\\item ") }, {
    condition = text_mode.condition,
    show_condition = text_mode.show_condition,
    callbacks = {
      [-1] = {
        [events.leave] = function(node, _)
          vim.cmd(tc([[normal ==]]))
        end,
      },
    },
  }),

  snippet({ trig = "...", wordTrig = false }, fmta([[\ldots]], {})),

  snippet("qq", fmta([[`<>']], vi(1)), text_mode),
  snippet("QQ", fmta([[``<>'']], vi(1)), text_mode),
  -- snippet("mm", fmta([[$<>$]], vi(1)), text_mode),
  snippet("mm", fmta([[\(<>\)]], vi(1)), text_mode),
  -- snippet({ trig = "$", wordTrig = false }, fmta([[$<>$]], { i(1) }), text_mode),
  -- snippet({ trig = "$", wordTrig = true }, fmta([[\(<>\)]], { i(1) }), text_mode),
  -- snippet({ trig = "'", wordTrig = true }, fmta([[`<>']], { i(1) }), text_mode),
  -- snippet({ trig = '"', wordTrig = true }, fmta([[``<>'']], { i(1) }), text_mode),

  snippet(
    { trig = "^lig", name = "align", regTrig = true },
    fmta(
      [[
        \begin{align*}
          <>
        \end{align*}<>]],
      { i(1), i(0) }
    ),
    text_mode
  ),

  snippet(
    { trig = "^(%*?)beq", name = "equation", regTrig = true },
    fmta(
      [[
        \begin{equation<>}
          <>
        \end{equation<>}<>]],
      {
        f(function(_, snip)
          if snip.captures[1] == "*" then
            return ""
          else
            return "*"
          end
        end),
        i(1),
        f(function(_, snip)
          if snip.captures[1] == "*" then
            return ""
          else
            return "*"
          end
        end),

        i(0),
      }
    ),
    text_mode
  ),

  snippet(
    "buzzproof",
    fmta(
      [[
        \begin{prooftree}
          <>
        \end{prooftree}<>]],
      { i(1), i(0) }
    )
  ),
  snippet(
    {
      trig = "^doc",
      regTrig = true,
      wordTrig = false,
      priority = 1000,
      name = "^doc",
    },
    fmta(
      [[
  \begin{document}
  <>
  \end{document}
  ]],
      { i(0) }
    ),
    text_mode
  ),

  -- snippet({ trig = "^beg", regTrig = true, enabled = false }, {
  -- 	c(1, {
  -- 		sn(
  -- 			nil,
  -- 			fmta(
  -- 				[[
  --              \begin{<>}
  --                <>
  --              \end{<>}
  --            ]],
  -- 				{
  -- 					r(1, "env"),
  -- 					i(2),
  -- 					rep(1),
  -- 				}
  -- 			)
  -- 		),
  -- 		sn(
  -- 			nil,
  -- 			fmta(
  -- 				[[
  --              \begin{<>}[<>]
  --                <>
  --              \end{<>}
  --            ]],
  -- 				{
  -- 					r(1, "env"),
  -- 					i(2, "options"),
  -- 					i(3),
  -- 					rep(1),
  -- 				}
  -- 			)
  -- 		),
  -- 	}),
  -- }, {
  -- 	stored = {
  -- 		env = i(1, "env"),
  -- 	},
  -- }),
  snippet({ trig = "__", regTrig = false, wordTrig = false }, fmta([[\sub{<>}]], { i(1) }), text_mode),
  snippet({ trig = "^^", regTrig = false, wordTrig = false }, fmta([[\super{<>}]], { i(1) }), text_mode),
}
