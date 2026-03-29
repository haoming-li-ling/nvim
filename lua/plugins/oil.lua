local detail = false
return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    enabled = true,
    keys = {
      { "<leader>O", "<cmd>Oil<cr>", desc = "Open Oil", silent = true },
    },
    opts = {
      default_file_explorer = true,
      keymaps = {
        ["<BS>"] = { "actions.parent", mode = "n" },
        ["H"] = { "actions.parent", mode = "n" },
        ["L"] = { "actions.select", mode = "n" },
        ["<Tab>"] = { "<leader>ww", mode = "n", remap = true },
        ["<leader>O"] = { "<C-c>", remap = true },
        ["gd"] = {
          desc = "Toggle file detail view",
          callback = function()
            detail = not detail
            if detail then
              require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
            else
              require("oil").set_columns({ "icon" })
            end
          end,
        },
      },
    },
  },
}
