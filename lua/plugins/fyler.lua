vim.pack.add({
  "https://github.com/A7Lavinraj/fyler.nvim",
  -- "https://github.com/echasnovski/mini.icons",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "fyler",
  callback = function()
    -- vim.keymap.set("n", "<leader>e", "<cmd>close<cr>", { buffer = true })
    -- vim.keymap.set("n", "<leader>e", "<cmd>close<cr>", { buffer = true })
    vim.keymap.set("n", "<leader>F", "<cmd>close<cr>", { buffer = true })
  end,
})
vim.keymap.set("n", "<leader>e", function()
  require("fyler").toggle({ kind = "split_left_most" })
end, {})
vim.keymap.set("n", "<leader>F", function()
  require("fyler").toggle({ kind = "split_right_most" })
end, {})
vim.keymap.set("n", "<leader>flf", "<cmd>Fyler kind=float<cr>", {})
vim.keymap.set("n", "<leader>flb", "<cmd>Fyler kind=split_below_all<cr>", {})
vim.keymap.set("n", "<leader>fll", "<cmd>Fyler kind=split_left_most<cr>", {})

local dot = require("util").dot
local Some = require("option").some

local helper = require("fyler.views.finder.helper")
require("fyler").setup({
  views = {
    finder = {
      git_status = {
        enabled = true,
      },
      mappings = {
        ["<space>"] = function(self)
          local _ = Some(helper.parse_ref_id(vim.api.nvim_get_current_line()))
            :fmap(dot(self.files, "node_entry"))
            :fmap(function(obj)
              vim.system({ "qlmanage", "-p", vim.fn.fnameescape(obj.path) })
            end)
        end,
        ["<D-o>"] = function(self)
          local _ = Some(helper.parse_ref_id(vim.api.nvim_get_current_line()))
            :fmap(dot(self.files, "node_entry"))
            :fmap(function(obj)
              vim.ui.open(vim.fn.fnameescape(obj.path))
            end)
        end,
      },
      win = {
        kind = "split_left_most",
        kinds = {
          split_above = {
            height = "20%",
          },
          split_below = {
            height = "20%",
          },
          split_above_all = {
            height = "20%",
          },
          split_below_all = {
            height = "20%",
          },
          split_left = {
            width = "20%",
          },
          split_left_most = {
            -- width = "20%",
            width = "35",
          },
          split_right = {
            width = "20%",
          },
          split_right_most = {
            width = "20%",
          },
        },
      },
    },
  },
  hooks = {
    on_rename = function(src_path, destination_path)
      Snacks.rename.on_rename_file(src_path, destination_path)
    end,
  },
})
