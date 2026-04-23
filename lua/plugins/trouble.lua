vim.pack.add({
  "https://github.com/folke/trouble.nvim",
})
require("trouble").setup({
  modes = {
    symbols = {
      filter = {
        ["not"] = {
          {
            any = {
              {
                ft = "lua",
                kind = "Package",
              },
              {
                ft = "tex",
                kind = "Enum",
              },
            },
          },
        },
      },
    },
  },
})
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Toggle Trouble" })
vim.keymap.set(
  "n",
  "<leader>xw",
  "<cmd>Trouble workspace_diagnostics toggle<cr>",
  { desc = "Toggle workspace diagnostics" }
)
vim.keymap.set(
  "n",
  "<leader>xb",
  "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
  { desc = "Toggle buffer diagnostics" }
)
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix toggle<cr>", { desc = "Toggle quickfix" })
vim.keymap.set("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
vim.keymap.set("n", "<leader>xL", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", {
  desc = "LSP Definitions / references / ... (Trouble)",
})
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", { desc = "Toggle loclist" })
vim.keymap.set("n", "<leader>ss", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
