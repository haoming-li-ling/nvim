local prefix = "<leader>x"

local kinds = {
  Array = " ",
  Boolean = "󰨙 ",
  Class = " ",
  Constant = "󰏿 ",
  Constructor = " ",
  Enum = " ",
  EnumMember = " ",
  Event = " ",
  Field = " ",
  File = " ",
  Function = "󰊕 ",
  Interface = " ",
  Key = " ",
  Method = "󰊕 ",
  Module = " ",
  Namespace = "󰦮 ",
  Null = " ",
  Number = "󰎠 ",
  Object = " ",
  Operator = " ",
  Package = " ",
  Property = " ",
  String = " ",
  Struct = "󰆼 ",
  TypeParameter = " ",
  Variable = "󰀫 ",
}
return {
  {
    "folke/trouble.nvim",
    keys = {
      -- { "gR", "<cmd>Trouble lsp_references toggle<cr>", desc = "Toggle LSP references" },
      { prefix .. "x", "<cmd>Trouble diagnostics toggle<cr>", desc = "Toggle Trouble" },
      { prefix .. "w", "<cmd>Trouble workspace_diagnostics toggle<cr>", desc = "Toggle workspace diagnostics" },
      { prefix .. "b", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Toggle buffer diagnostics" },
      { prefix .. "q", "<cmd>Trouble quickfix toggle<cr>", desc = "Toggle quickfix" },
      {
        prefix .. "s",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        prefix .. "L",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      { prefix .. "l", "<cmd>Trouble loclist toggle<cr>", desc = "Toggle loclist" },
      { "<leader>ss", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
      -- {
      --   "[d",
      --   function()
      --     require("trouble").prev({ mode = "diagnostics" })
      --   end,
      --   desc = "Go to previous diagnostic",
      -- },
      -- {
      --   "]d",
      --   function()
      --     require("trouble").next({ mode = "diagnostics" })
      --   end,
      --   desc = "Go to next diagnostic",
      -- },
      -- {
      --   "[E",
      --   function()
      --     require("trouble").prev({ mode = "diagnostics", severity = vim.diagnostic.severity.ERROR })
      --   end,
      --   desc = "Go to previous error",
      -- },
      -- {
      --   "]E",
      --   function()
      --     require("trouble").next({ mode = "diagnostics", severity = vim.diagnostic.severity.ERROR })
      --   end,
      --   desc = "Go to next error",
      -- },
    },
    opts = {
      modes = {
        symbols = {
          filter = {
            ["not"] = {
              {
                any = {
                  {
                    ft = "lua",
                    kind = "Package",
                    -- any = {
                    -- 	{ kind = "Package" },
                    -- },
                  },
                  {
                    ft = "tex",
                    kind = "Enum",
                    -- any = {
                    -- 	{ kind = "Module" },
                    -- },
                  },
                },
              },
            },
          },
        },
      },
    },
    -- config = true,
  },
}
