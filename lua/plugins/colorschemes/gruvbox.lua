local palette = require("gruvbox").palette

require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  -- italic = false,
  inverse = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  contrast = "soft", -- can be "hard" or "soft"
  overrides = {
    TelescopeNormal = { bg = palette.dark2 },
    TelescopeBorder = { bg = palette.dark2 },
    TelescopePreviewNormal = { bg = palette.dark1 },
    TelescopePreviewBorder = { bg = palette.dark1 },
    TelescopePreviewTitle = { fg = palette.dark1, bg = palette.bright_blue },
    TelescopePromptTitle = { fg = palette.dark1, bg = palette.bright_purple },
    TelescopeResultsTitle = { fg = palette.dark1, bg = palette.neutral_yellow },
    IndentBlanklineContextChar = {
      fg = palette.neutral_purple,
      nocombine = true },
    IndentBlanklineContextStart = {
      sp = palette.neutral_purple,
      underline = true },
    SpellBad = { sp = "#ff0000", underline = true },
    TSString = { fg = palette.bright_green },
    TSComment = { fg = palette.gray, italic = true } } })
vim.o.background = "dark"
vim.cmd([[hi! link @module.latex @function.latex]])
vim.cmd([[colorscheme gruvbox]])
