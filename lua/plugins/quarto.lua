vim.pack.add({
  "https://github.com/Kicamon/markdown-table-mode.nvim",
  "https://github.com/quarto-dev/quarto-nvim",
  "https://github.com/jmbuhr/otter.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter",
})

require("markdown-table-mode").setup({
  filetype = {
    "*.md",
    "*.qmd",
  },
})

vim.cmd([[autocmd Filetype quarto call vimtex#init()]])
