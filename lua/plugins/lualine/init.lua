local vanilla_config = require("plugins.lualine.vanilla")
vim.pack.add({
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/chrisgrieser/nvim-recorder",
})

require("lualine").setup(vanilla_config)
