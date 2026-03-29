return {
  "obsidian-nvim/obsidian.nvim",
  -- enabled = false,
  -- lazy = true,
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   -- "BufReadPre /Users/haomingli/Library/Mobile\\ Documents/iCloud~md~obsidian/Documents/Obsidian\\ Notes/**.md",
  --   -- "BufNewFile /Users/haomingli/Library/Mobile\\ Documents/iCloud~md~obsidian/Documents/Obsidian\\ Notes/**.md",
  --   -- "BufReadPre *.md",
  --   -- "BufNewFile *.md",
  -- },
  keys = {
    { "<leader>on", "<cmd>Obsidian new<cr>", desc = "New note" },
    { "<leader>ow", "<cmd>Obsidian workspace notes<cr>", desc = "Notes workspace" },
    { "<leader>os", "<cmd>Obsidian search<cr>", desc = "Search" },
    { "<leader>ol", ":Obsidian link ", desc = "Link", mode = { "n", "x" } },
  },
  ft = "markdown",
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
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
  },
}
