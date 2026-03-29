return {
  {
    "chomosuke/typst-preview.nvim",
    enabled = true,
    ft = "typst",
    version = "1.*",
    opts = {}, -- lazy.nvim will implicitly calls `setup {}`
  },
  -- {
  --   "al-kot/typst-preview.nvim",
  --   keys = {
  --     { "<leader>mtps", "<cmd>TypstPreviewStart<cr>" },
  --     { "<leader>mtpc", "<cmd>TypstPreviewClose<cr>" },
  --     { "<leader>mtpn", "<cmd>TypstPreviewGoto " },
  --     { "<leader>mtpl", "<cmd>TypstPreviewGoto " },
  --   },
  --   opts = {
  --     -- your config here
  --   },
  -- },
}
