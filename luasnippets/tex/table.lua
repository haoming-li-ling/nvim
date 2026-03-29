local rec_ls = require("plugins.luasnip.util").rec_ls
local table_node = require("plugins.luasnip.util").table_node
local tableau_constraints = require("plugins.luasnip.util").tableau_constraints
local tableau_candidates = require("plugins.luasnip.util").tableau_candidates
local tableau_optimal = require("plugins.luasnip.util").tableau_optimal
local rec_table = require("plugins.luasnip.util").rec_table
local rec_table_full = require("plugins.luasnip.util").rec_table_full

return {
  snippet(
    "tabu",
    fmta(
      [[
        \begin{tabular}{<>}
        <><>
        \end{tabular}
      ]],
      {
        i(1, "ccc"),
        d(2, table_node, 1),
        d(3, rec_table),
      }
    ),
    text_mode
  ),

  snippet(
    "tabl",
    fmta(
      [[
        \begin{tableau}{<>}
        <>
        <>
        <>
        \end{tableau}
      ]],
      {
        i(1, "ccc"),
        d(2, tableau_constraints, 1),
        d(3, tableau_candidates, 1),
        d(4, tableau_optimal, 1),
      }
    ),
    text_mode
  ),

  snippet(
    {
      trig = "^table",
      regTrig = true,
      wordTrig = true,
      priority = 1000,
      name = "Table",
    },
    fmta(
      [[
        \begin{table}[<>]
          \centering
          \caption{<>}
          \label{tab:<>}
          \begin{tabular}{<>}
          <><>
          \end{tabular}
        \end{table}
      ]],
      {
        i(1, "htpb"),
        i(2, "caption"),
        i(3, "label"),
        i(4, "ccc"),
        d(5, table_node, 4),
        d(6, rec_table_full),
      }
    ),
    text_mode
  ),
  snippet(
    { trig = "itm", name = "itemize", regTrig = true },
    fmta(
      [[
        \begin{itemize}[noitemsep]
          \item <><>
        \end{itemize}<>]],
      { i(1), d(2, rec_ls, {}), i(0) }
    ),
    text_mode
  ),
  snippet(
    { trig = "item", name = "itemize", regTrig = true },
    fmta(
      [[
          \begin{itemize}
            \item <><>
          \end{itemize}<>
        ]],
      { i(1), d(2, rec_ls), i(0) }
    ),
    text_mode
  ),
  snippet(
    { trig = "ben", name = "enumerate", regTrig = true },
    fmta(
      [[
  \begin{enumerate}
    \item <><>
  \end{enumerate}<>
  ]],
      { i(1), d(2, rec_ls), i(0) }
    ),
    text_mode
  ),
}, {}
