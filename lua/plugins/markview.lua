return {
  "OXY2DEV/markview.nvim",
  enabled = true,
  -- lazy = false, -- Recommended
  ft = { "markdown" }, -- If you decide to lazy-load anyway
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    latex = {
      enable = false,
      fonts = false,
      subscripts = false,
      superscripts = false,
      symbols = false,
      parenthesis = false,
      texts = false,
    },
  },
}
