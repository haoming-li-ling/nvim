return {
  -- Using lazy.nvim
  {
    "josephschmitt/pj.nvim",
    enabled = true,
    dependencies = {
      "folke/snacks.nvim",
    },
    cmd = { "Pj", "PjCd" },
    keys = {
      { "<leader>pp", "<cmd>Pj<cr>", desc = "Find Projects" },
    },
    opts = {
      behavior = {
        session_manager = "persistence",
        cd_scope = "tab",
      },
    },
  },
  {
    "coffebar/neovim-project",
    enabled = false,
    opts = {
      last_session_on_startup = false,
      projects = { -- define project roots
        "~/repos/*",
        "~/.config/*",
        "~/Documents/MIT/projects/*",
      },
      picker = {
        type = "snacks", -- one of "telescope", "fzf-lua", or "snacks"
      },
    },
    init = function()
      -- enable saving the state of plugins in the session
      vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
    end,
    keys = {
      { "<leader>pp", "<cmd>NeovimProjectDiscover<cr>", desc = "Projects" },
    },
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      -- optional picker
      { "folke/snacks.nvim" },
      { "Shatur/neovim-session-manager" },
    },
    lazy = false,
    priority = 100,
  },
}
