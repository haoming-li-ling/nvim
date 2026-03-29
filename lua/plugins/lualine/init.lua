local vanilla_config = require("plugins.lualine.vanilla")
return {
  {
    "nvim-lualine/lualine.nvim",
    enabled = true,
    dependencies = { "chrisgrieser/nvim-recorder" },
    event = "VeryLazy",
    config = function()
      -- require("lualine").setup(evil_config)
      -- require("lualine").setup(regular_config)
      require("lualine").setup(vanilla_config)
    end,
  },
}
