local palette = require("nvim-tundra.palette.arctic")
require("nvim-tundra").setup({
  plugins = {
    telescope = true,
    cmp = true,
    lsp = true,
    gitsigns = true,
  },
  overwrite = {
    highlights = {
      Conceal = { fg = palette.orange._500 },
      TelescopeBorder = { bg = palette.gray._750 },
      TelescopeNormal = { bg = palette.gray._750 },
      TelescopePromptNormal = { bg = palette.gray._750 },
      TelescopePromptBorder = { bg = palette.gray._750 },
      TelescopeResultsNormal = { bg = palette.gray._750 },
      TelescopeResultsBorder = { bg = palette.gray._750 },
      TelescopePreviewBorder = { bg = palette.gray._800 },
      TelescopePreviewNormal = { bg = palette.gray._800 },
      TelescopePromptTitle = { fg = palette.gray._1000, bg = palette.green._500 },
      TelescopeResultsTitle = { fg = palette.gray._1000, bg = palette.orange._500 },
      TelescopePreviewTitle = { fg = palette.gray._1000, bg = palette.red._500 },
      -- ["@field"] = { fg = palette. }
    },
  },
})
vim.o.background = "dark"
vim.cmd([[colorscheme tundra]])
vim.cmd([[hi clear SpellBad]])
vim.cmd([[hi SpellBad gui=undercurl guisp=#FF0000]])
vim.cmd([[hi! link NonText LineNr]])
vim.cmd([[hi! link NvimTreeVertSplit WinSeparator]])
vim.cmd([[hi! link TexFootnoteArg Type]])
vim.cmd([[hi! link helpCommand helpExample]])
vim.cmd([[hi! link helpExample Function]])
-- vim.cmd([[hi! link helpCommand Function]])
