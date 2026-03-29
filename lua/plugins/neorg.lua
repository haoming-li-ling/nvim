return {
  {
    "nvim-neorg/neorg",
    enabled = true,
    -- lazy = false,
    version = "*",
    keys = {
      -- { "<leader>nrf", "<cmd>Neorg workspace notes<cr>", desc = "Open workspace notes" },
      {
        "<leader>nrf",
        function()
          vim.cmd([[Neorg workspace notes]])
          -- vim.cmd([[Telescope find_files cwd=/Users/haomingli/Documents/neorg/notes]])
          Snacks.picker.files({ cwd = "/Users/haomingli/Documents/neorg/notes" })
        end,
        -- "<cmd>Neorg workspace notes | Telescope find_files cwd=~/Documents/neorg/notes<cr>",
        desc = "Find notes",
      },
      {
        "<leader>nrm",
        "<cmd>Neorg inject-metadata<cr>",
        desc = "Inject metadata",
      },
      {
        "<leader>nwn",
        "<cmd>Neorg workspace notes<cr>",
        desc = "Workspace notes",
      },
    },
    cmd = { "Neorg" },
    ft = { "norg" },
    -- build = ":Neorg sync-parsers",
    dependencies = {
      -- { "luarocks.nvim" },
      -- { "nvim-lua/plenary.nvim" },
      -- { "nvim-treesitter" },
      -- { "nvim-neorg/neorg-telescope", lazy = true },
      { "benlubas/neorg-interim-ls", lazy = true },
      -- { "nvim-telescope/telescope.nvim" },
    },
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.neorgcmd"] = {},
        ["core.summary"] = {},
        ["core.journal"] = {},
        ["core.autocommands"] = {},
        ["core.ui"] = {},
        -- ["core.ui.calendar"] = {},
        ["core.export"] = { config = {} },
        ["core.export.markdown"] = { config = {} },
        ["core.integrations.treesitter"] = { config = {} },
        ["core.esupports.metagen"] = { config = { update_date = false } },
        ["core.concealer"] = {
          config = {
            dim_code_blocks = {
              conceal = false,
            },
          },
        }, -- Adds pretty icons to your documents
        -- ["core.integrations.telescope"] = {},
        ["core.completion"] = {
          config = {
            -- engine = "nvim-cmp",
            engine = { module_name = "external.lsp-completion" },
          },
        },
        ["core.keybinds"] = {
          config = {
            default_keybinds = true,
            neorg_leader = "<leader>",
          },
        },
        ["core.qol.todo_items"] = {
          config = {
            create_todo_items = true,
            create_todo_parents = true,
          },
        },
        -- ["core.tempus"] = {},
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/Documents/neorg/notes",
            },
          },
        },
        ["external.interim-ls"] = {
          config = {
            -- default config shown
            completion_provider = {
              -- Enable or disable the completion provider
              enable = true,

              -- Show file contents as documentation when you complete a file name
              documentation = true,

              -- Try to complete categories provided by Neorg Query. Requires `benlubas/neorg-query`
              categories = false,

              -- suggest heading completions from the given file for `{@x|}` where `|` is your cursor
              -- and `x` is an alphanumeric character. `{@name}` expands to `[name]{:$/people:# name}`
              people = {
                enable = false,

                -- path to the file you're like to use with the `{@x` syntax, relative to the
                -- workspace root, without the `.norg` at the end.
                -- ie. `folder/people` results in searching `$/folder/people.norg` for headings.
                -- Note that this will change with your workspace, so it fails silently if the file
                -- doesn't exist
                path = "people",
              },
            },
          },
        },
      },
    },
    config = function(_, opts)
      -- local neorg_callbacks = require("neorg.callbacks")
      -- neorg_callbacks.on_event(
      --   "core.keybinds.events.enable_keybinds",
      --   function(_, keybinds)
      --     -- Map all the below keybinds only when the "norg" mode is active
      --     keybinds.map_event_to_mode("norg", {
      --       n = { -- Bind keys in normal mode
      --         { "<leader>mll", "core.integrations.telescope.find_linkable" },
      --       },
      --       i = { -- Bind in insert mode
      --         { "<c-c><c-l>", "core.integrations.telescope.insert_link" },
      --       },
      --     }, {
      --       silent = true,
      --       noremap = true,
      --     })
      --   end,
      --   _
      -- )
      require("neorg").setup(opts)
    end,
  },
}
