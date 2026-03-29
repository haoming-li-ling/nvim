require("kanagawa").setup({
  compile = true,
  overrides = function(colors)
    return {
      WinSeparator = { fg = "#ffffff" },
    }
  end,
})
require("kanagawa").load("wave")
