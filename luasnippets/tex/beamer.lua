return {
  snippet(
    "fr",
    fmta(
      [[
      \begin{frame}{<>}
        <>
      \end{frame}
      ]],
      { i(1), i(2) }
    )
  ),
  snippet(
    "fri",
    fmta(
      [[
  \begin{frame}{<>}
    \begin{itemize}
      \item <>
    \end{itemize}
  \end{frame}
  ]],
      { i(1), i(2) }
    )
  ),
}
