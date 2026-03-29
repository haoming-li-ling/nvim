local harpoon_prefix = "<leader>d"
return {
  {
    "mcauley-penney/visual-whitespace.nvim",
    event = "ModeChanged *:[vV\22]", -- optionally, lazy load on entering visual mode
    opts = {},
  },
  {
    "lewis6991/gitsigns.nvim",
    -- event = "VeryLazy",
    enabled = false,
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
    dependencies = {
      "folke/trouble.nvim",
    },
  },
  {
    "nacro90/numb.nvim",
    event = "CmdlineEnter",
    opts = {},
  },
  {
    "ThePrimeagen/harpoon",
    keys = {
      {
        harpoon_prefix .. "<Tab>",
        function()
          require("harpoon.ui").nav_next()
        end,
        desc = "next",
      },
      {
        harpoon_prefix .. "<S-Tab>",
        function()
          require("harpoon.ui").nav_prev()
        end,
        desc = "previous",
      },
      {
        harpoon_prefix .. "m",
        function()
          require("harpoon.mark").add_file()
        end,
        desc = "add file",
      },
      {
        harpoon_prefix .. "d",
        function()
          require("harpoon.mark").rm_file()
        end,
        desc = "remove file",
      },
      {
        harpoon_prefix .. "q",
        function()
          require("harpoon.ui").nav_file(1)
        end,
        desc = "file 1",
      },
      {
        harpoon_prefix .. "w",
        function()
          require("harpoon.ui").nav_file(2)
        end,
        desc = "file 2",
      },
      {
        harpoon_prefix .. "e",
        function()
          require("harpoon.ui").nav_file(3)
        end,
        desc = "file 3",
      },
      {
        harpoon_prefix .. "r",
        function()
          require("harpoon.ui").nav_file(4)
        end,
        desc = "file 4",
      },
      {
        harpoon_prefix .. "t",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        desc = "toggle menu",
      },
    },
  },
}
