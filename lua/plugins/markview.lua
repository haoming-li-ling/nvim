vim.pack.add({
  "https://github.com/OXY2DEV/markview.nvim",
})

require("markview").setup({
  preview = {
    icon_provider = "mini", -- "mini" or "devicons"
  },
  latex = {
    enable = false,
    fonts = false,
    subscripts = false,
    superscripts = false,
    symbols = false,
    parenthesis = false,
    texts = false,
  },
})
