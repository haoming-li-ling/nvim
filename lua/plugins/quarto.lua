return {
  {
    "Kicamon/markdown-table-mode.nvim",
    ft = { "quarto", "markdown" },
    opts = {
      filetype = {
        "*.md",
        "*.qmd",
      },
    },
    -- config = function()
    -- 	require("markdown-table-mode").setup()
    -- end,
  },
  {
    "quarto-dev/quarto-nvim",
    ft = { "quarto" },
    init = function()
      vim.cmd([[autocmd Filetype quarto call vimtex#init()]])
    end,
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
