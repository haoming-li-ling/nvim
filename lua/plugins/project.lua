vim.pack.add({
  "https://github.com/josephschmitt/pj.nvim",
})

vim.keymap.set("n", "<leader>pp", "<cmd>Pj<cr>", { desc = "Find Projects" })

require("pj").setup({
  behavior = {
    cd_scope = "tab",
    session_manager = "persistence",
  },
})
