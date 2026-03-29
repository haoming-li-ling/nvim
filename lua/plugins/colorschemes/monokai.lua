local monokai = require("monokai")
local palette = monokai.pro
-- local palette = monokai.ristretto
-- local palette = monokai.classic
monokai.setup({
  -- italics = false,
  palette = palette,
  custom_hlgroups = {
    TelescopeBorder = { bg = palette.base3 },
    TelescopeNormal = { bg = palette.base3 },
    TelescopePromptNormal = { bg = palette.base3 },
    TelescopePromptBorder = { bg = palette.base3 },
    TelescopeResultsNormal = { bg = palette.base3 },
    TelescopeResultsBorder = { bg = palette.base3 },
    TelescopePreviewBorder = { bg = palette.base1 },
    TelescopePreviewNormal = { bg = palette.base1 },
    TelescopePromptTitle = { fg = palette.black, bg = palette.green },
    TelescopeResultsTitle = { fg = palette.black, bg = palette.orange },
    TelescopePreviewTitle = { fg = palette.black, bg = palette.red },
    IndentBlanklineContextChar = { fg = palette.aqua, nocombine = true },
    IndentBlanklineContextStart = { sp = palette.aqua, underline = true },
    Conceal = { fg = palette.orange },
    SpellBad = { underline = true, sp = "#ff0000" },
    TSField = { fg = palette.purple },
    TSBoolean = { fg = palette.orange },
    TSConstBuiltin = { fg = palette.orange },
    TSNumber = { fg = palette.orange },
    TSFloat = { fg = palette.orange },
    TSParameter = { fg = palette.orange },
    TSComment = { fg = "#a0a0a0", style = "italic" },
    Comment = { fg = "#a0a0a0", style = "italic" },
    TSFunctionCall = { fg = palette.green, style = "NONE" },
    TSKeyword = { fg = palette.pink, style = "NONE" },
    TSKeywordFunction = { fg = palette.pink, style = "NONE" },
  },
})
