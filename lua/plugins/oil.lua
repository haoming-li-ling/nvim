local detail = false
vim.pack.add({
  "https://github.com/stevearc/oil.nvim",
})

vim.keymap.set("n", "<leader>O", "<cmd>Oil<cr>", { desc = "Open Oil", silent = true })

require("oil").setup({
  default_file_explorer = true,
  keymaps = {
    ["<BS>"] = {
      "actions.parent",
      mode = "n",
    },
    ["<Tab>"] = {
      "<leader>ww",
      mode = "n",
      remap = true,
    },
    ["<leader>O"] = {
      "<C-c>",
      remap = true,
    },
    H = {
      "actions.parent",
      mode = "n",
    },
    L = {
      "actions.select",
      mode = "n",
    },
    gd = {
      callback = function()
        detail = not detail
        if detail then
          require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
        else
          require("oil").set_columns({ "icon" })
        end
      end,
      desc = "Toggle file detail view",
    },
  },
})
