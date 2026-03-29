require("onedark").setup({
  colors = {
    bg4 = "#4c505d",
    lighter_gray = "#959ca9",
  },
  highlights = {
    TelescopeSelection = { bg = "$bg4" },
    TelescopeBorder = { bg = "$bg3" },
    TelescopeNormal = { bg = "$bg3" },
    TelescopePromptNormal = { bg = "$bg3" },
    TelescopePromptBorder = { bg = "$bg3" },
    TelescopeResultsNormal = { bg = "$bg3" },
    TelescopeResultsBorder = { bg = "$bg3" },
    TelescopePreviewBorder = { bg = "$bg1" },
    TelescopePreviewNormal = { bg = "$bg1" },
    TelescopePromptTitle = { fg = "$black", bg = "$green" },
    TelescopeResultsTitle = { fg = "$black", bg = "$orange" },
    TelescopePreviewTitle = { fg = "$black", bg = "$red" },
    IndentBlanklineContextChar = { fg = "$yellow", nocombine = true },
    IndentBlanklineContextStart = { sp = "$yellow", underline = true },
    Conceal = { fg = "$orange", bg = "$bg1" },
    SpellBad = { underline = true, sp = "#ff0000" },
    TSComment = { fg = "#737a87", italic = true },
    TSStrong = { fg = "#ffffff", bold = true },
  },
})

require("onedark").load()
