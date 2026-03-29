return {
  {
    "A7Lavinraj/fyler.nvim",
    enabled = true,
    -- branch = "stable",
    dependencies = { "echasnovski/mini.icons" },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "fyler",
        callback = function()
          -- vim.keymap.set("n", "<leader>e", "<cmd>close<cr>", { buffer = true })
          -- vim.keymap.set("n", "<leader>e", "<cmd>close<cr>", { buffer = true })
          vim.keymap.set("n", "<leader>F", "<cmd>close<cr>", { buffer = true })
        end,
      })
    end,
    keys = {
      -- { "<leader>e", "<cmd>Fyler kind=split_left_most<cr>" },
      {
        "<leader>e",
        function()
          require("fyler").toggle({ kind = "split_left_most" })
        end,
      },
      {
        "<leader>F",
        function()
          require("fyler").toggle({ kind = "split_right_most" })
        end,
      },
      { "<leader>flf", "<cmd>Fyler kind=float<cr>" },
      { "<leader>flb", "<cmd>Fyler kind=split_below_all<cr>" },
      { "<leader>fll", "<cmd>Fyler kind=split_left_most<cr>" },
    },
    opts = function()
      local meth_f = require("util").meth_f
      local Some = require("option").some

      local helper = require("fyler.views.finder.helper")
      return {
        views = {
          finder = {
            git_status = {
              enabled = true,
            },
            mappings = {
              ["<space>"] = function(self)
                local _ = Some(helper.parse_ref_id(vim.api.nvim_get_current_line()))
                  :wind(meth_f(self.files, "node_entry"))
                  :wind(function(obj)
                    vim.system({ "qlmanage", "-p", vim.fn.fnameescape(obj.path) })
                  end)
              end,
              ["<D-o>"] = function(self)
                local _ = Some(helper.parse_ref_id(vim.api.nvim_get_current_line()))
                  :wind(meth_f(self.files, "node_entry"))
                  :wind(function(obj)
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
      }
    end,
  },
}
