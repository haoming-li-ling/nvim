vim.pack.add({
  "https://github.com/lewis6991/gitsigns.nvim",
})
vim.pack.add({
  "https://github.com/mcauley-penney/visual-whitespace.nvim",
  "https://github.com/nacro90/numb.nvim",
  "https://github.com/ThePrimeagen/harpoon",
})

require("visual-whitespace").setup()

require("numb").setup()

vim.keymap.set("n", "<leader>d<Tab>", function()
  require("harpoon.ui").nav_next()
end, { desc = "next" })
vim.keymap.set("n", "<leader>d<S-Tab>", function()
  require("harpoon.ui").nav_prev()
end, { desc = "previous" })
vim.keymap.set("n", "<leader>dm", function()
  require("harpoon.mark").add_file()
end, { desc = "add file" })
vim.keymap.set("n", "<leader>dd", function()
  require("harpoon.mark").rm_file()
end, { desc = "remove file" })
vim.keymap.set("n", "<leader>dq", function()
  require("harpoon.ui").nav_file(1)
end, { desc = "file 1" })
vim.keymap.set("n", "<leader>dw", function()
  require("harpoon.ui").nav_file(2)
end, { desc = "file 2" })
vim.keymap.set("n", "<leader>de", function()
  require("harpoon.ui").nav_file(3)
end, { desc = "file 3" })
vim.keymap.set("n", "<leader>dr", function()
  require("harpoon.ui").nav_file(4)
end, { desc = "file 4" })
vim.keymap.set("n", "<leader>dt", function()
  require("harpoon.ui").toggle_quick_menu()
end, { desc = "toggle menu" })
