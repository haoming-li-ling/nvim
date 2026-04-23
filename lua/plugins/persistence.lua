vim.pack.add({
  "https://github.com/folke/persistence.nvim",
})

vim.keymap.set("n", "<leader>qs", '<cmd>lua require("persistence").load()<cr>', { desc = "Load current session" })
vim.keymap.set(
  "n",
  "<leader>ql",
  '<cmd>lua require("persistence").load({ last = true })<cr>',
  { desc = "Load last session" }
)
vim.keymap.set("n", "<leader>qd", '<cmd>lua require("persistence").stop()<cr>', { desc = "Stop session-saving" })
require("persistence").setup()
