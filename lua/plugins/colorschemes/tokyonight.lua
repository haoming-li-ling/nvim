require("tokyonight").setup({
  on_colors = function() end,
  on_highlights = function(hl, c)
    -- local prompt = "#2d3149"
    -- hl.texFootnoteArg = {
    -- 	fg = c.teal,
    -- }
    hl["@markup.footnote"] = {
      fg = c.magenta,
    }
    hl["Conceal"] = {
      fg = c.orange,
    }
    hl.WinSeparator = {
      -- bg = c.bg_dark,
      fg = "#FFFFFF",
    }
    hl.LineNr = {
      fg = c.comment,
    }
  end,
})
vim.cmd([[colorscheme tokyonight]])
vim.cmd([[hi DiagnosticUnnecessary NONE]])
vim.cmd([[hi link DiagnosticUnnecessary NONE]])
