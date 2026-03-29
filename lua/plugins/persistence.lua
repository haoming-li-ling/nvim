return {
  {
    "folke/persistence.nvim",
    keys = {
      {
        "<leader>qs",
        [[<cmd>lua require("persistence").load()<cr>]],
        desc = "Load current session",
      },
      {
        "<leader>ql",
        [[<cmd>lua require("persistence").load({ last = true })<cr>]],
        desc = "Load last session",
      },
      {
        "<leader>qd",
        [[<cmd>lua require("persistence").stop()<cr>]],
        desc = "Stop session-saving",
      },
    },
    event = "BufReadPre",
    opts = {
      -- add any custom options here
    },
  },
}
