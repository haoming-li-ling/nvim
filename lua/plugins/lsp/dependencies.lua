vim.pack.add({
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/smjonas/inc-rename.nvim",
  "https://github.com/folke/lazydev.nvim",
  "https://github.com/Bilal2453/luvit-meta",
  "https://github.com/mason-org/mason-lspconfig.nvim",
})

require("inc_rename").setup({})

require("lazydev").setup({
  library = {
    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    {
      path = "snacks.nvim",
      words = { "Snacks" },
    },
    {
      mods = { "wezterm" },
      path = "wezterm-types",
    },
  },
})

require("mason-lspconfig").setup({
  automatic_enable = false,
  automatic_installation = true,
})
