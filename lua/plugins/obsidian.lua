vim.pack.add({
  "https://github.com/obsidian-nvim/obsidian.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/folke/snacks.nvim",
})
vim.keymap.set("n", "<leader>on", "<cmd>Obsidian new<cr>", { desc = "New note" })
vim.keymap.set("n", "<leader>ow", "<cmd>Obsidian workspace notes<cr>", { desc = "Notes workspace" })
vim.keymap.set("n", "<leader>os", "<cmd>Obsidian search<cr>", { desc = "Search" })
vim.keymap.set({ "n", "x" }, "<leader>ol", ":Obsidian link ", { desc = "Link" })
require("obsidian").setup({
  legacy_commands = false,
  -- dir = "/Users/haomingli/Library/Mobile Documents/iCloud~md~obsidian/Documents/Obsidian Notes", -- no need to call 'vim.fn.expand' here
  -- dir = "~/Obsidian Notes",
  workspaces = {
    { name = "notes", path = "~/Obsidian Notes" },
  },
  picker = {
    name = "snacks.pick",
  },

  -- see below for full list of options 👇
})
