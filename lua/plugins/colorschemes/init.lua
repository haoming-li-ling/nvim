return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
  },
  { "navarasu/onedark.nvim", lazy = true },
  { "tanvirtin/monokai.nvim", lazy = true },
  { "marko-cerovac/material.nvim", lazy = true },
  { "sam4llis/nvim-tundra", lazy = true },
  { "ellisonleao/gruvbox.nvim", lazy = true },
  { "catppuccin/nvim", name = "catppuccin", lazy = true },
  { "rebelot/kanagawa.nvim", name = "kanagawa", lazy = true },
  { "EdenEast/nightfox.nvim", lazy = true },
  { "fynnfluegge/monet.nvim", name = "monet", lazy = true },
  { "savq/melange-nvim", name = "melange", lazy = true },
  {
    "AlexvZyl/nordic.nvim",
    -- lazy = false,
    -- priority = 1000,
    name = "nordic",
    lazy = true,
    -- config = function() require("nordic").load() end,
  },
  {
    "rmehri01/onenord.nvim",
    name = "onenord",
    lazy = true,
  },
  {
    "uhs-robert/oasis.nvim",
    lazy = true,
    enabled = false,
    -- lazy = false,
    -- priority = 1000,
    -- config = function()
    --   require("oasis").setup()      -- (see Configuration below for all customization options)
    --   vim.cmd.colorscheme("oasis")  -- After setup, apply theme (or a any style like "oasis-night")
    -- end
  },
}
