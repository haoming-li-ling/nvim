return {
  snippet({ trig = "^ignore", regTrig = true }, fmta([[-- stylua: ignore]], {})),
  snippet({ trig = "^start", regTrig = true }, fmta([[-- stylua: ignore start]], {})),
  snippet({ trig = "^end", regTrig = true }, fmta([[-- stylua: ignore end]], {})),

  snippet(
    "fn",
    fmta(
      [[
  function(<>)
    <>
  end]],
      { i(1), vi(2, "body", 1) }
    )
  ),
  snippet(
    "fun",
    fmta(
      [[
  function(<>)
    <><>return <>
  end]],
      {
        i(1),
        i(2, ""),
        d(4, function(args)
          local result
          if #args[1][1] > 0 then
            result = sn(nil, t({ "", "  " }))
          else
            result = sn(nil, t(""))
          end
          return result
        end, { 2 }),
        vi(3, "nil", 1),
      }
    )
  ),
  snippet(
    "vreq",
    fmta([[local <> = require("<>")]], {
      f(function(import_name)
        local parts = vim.split(import_name[1][1], ".", true)
        return parts[#parts] or ""
      end, 1),
      i(1),
    })
  ),
}, {
  snippet("fn!", fmta([[function() <> end]], { i(1) })),
}
