return {
  {
    "FluxxField/smart-motion.nvim",
    enabled = false,
    event = "VeryLazy",
    opts = {
      presets = {
        words = false, -- w, b, e, ge
        lines = false, -- j, k
        search = {
          s = false,
          f = false,
          F = false,
          t = true,
          T = true,
          [";"] = false,
          [","] = false,
          gs = true,
        }, -- s, f, F, t, T, ;, ,, gs
        delete = {
          d = false,
        }, -- d, dt, dT, rdw, rdl
        yank = false, -- y, yt, yT, ryw, ryl
        change = {
          c = false,
        }, -- c, ct, cT
        paste = false, -- p, P
        treesitter = false, -- ]], [[, ]c, [c, ]b, [b, daa, caa, yaa, dfn, cfn, yfn, saa
        diagnostics = false, -- ]d, [d, ]e, [e
        git = false, -- ]g, [g
        quickfix = false, -- ]q, [q, ]l, [l
        marks = false, -- g', gm
        misc = {
          gmd = true,
          gmy = true,
        }, -- . g. g0 g1-g9 gp gP gA-gZ gmd gmy (repeat, history, pins, global pins)
      },
    },
    config = function(_, opts)
      local sm = require("smart-motion")
      sm.setup(opts)

      local register = sm.motions.register
      register("f", {
        collector = "lines",
        extractor = "text_search_1_char",
        filter = "filter_words_after_cursor",
        visualizer = "hint_start",
        action = "jump",
        map = true,
        modes = { "n", "x", "o" },
      })
      register("F", {
        collector = "lines",
        extractor = "text_search_1_char",
        filter = "filter_words_before_cursor",
        visualizer = "hint_start",
        action = "jump",
        map = true,
        modes = { "n", "x", "o" },
      })
      register("t", {
        collector = "lines",
        extractor = "text_search_1_char_until",
        filter = "filter_words_after_cursor",
        visualizer = "hint_start",
        action = "jump",
        map = true,
        modes = { "n", "x", "o" },
      })
      register("T", {
        collector = "lines",
        extractor = "text_search_1_char_until",
        filter = "filter_words_before_cursor",
        visualizer = "hint_start",
        action = "jump",
        map = true,
        modes = { "n", "x", "o" },
      })
      -- register("w", {
      --   collector = "lines",
      --   extractor = "words",
      --   filter = "filter_words_after_cursor",
      --   visualizer = "hint_start",
      --   action = "jump",
      --   map = true,
      --   modes = { "n", "x" },
      --   metadata = {
      --     label = "Jump to Word after cursor",
      --   },
      -- })
      -- register("b", {
      --   collector = "lines",
      --   extractor = "words",
      --   filter = "filter_words_before_cursor",
      --   visualizer = "hint_start",
      --   action = "jump",
      --   map = true,
      --   modes = { "n", "x" },
      --   metadata = {
      --     label = "Jump to Word after cursor",
      --   },
      -- })

      -- register("e", {
      --   collector = "lines",
      --   extractor = "words",
      --   filter = "filter_words_after_cursor",
      --   visualizer = "hint_end",
      --   action = "jump",
      --   map = true,
      --   modes = { "n", "x" },
      --   metadata = {
      --     label = "Jump to Word after cursor",
      --   },
      -- })
      -- register("ge", {
      --   collector = "lines",
      --   extractor = "words",
      --   filter = "filter_words_before_cursor",
      --   visualizer = "hint_end",
      --   action = "jump",
      --   map = true,
      --   modes = { "n", "x" },
      --   metadata = {
      --     label = "Jump to Word after cursor",
      --   },
      -- })
      -- require("smart-motion").motions.register("s", {
      --   collector = "lines",
      --   extractor = "text_search_2_char",
      --   -- filter = "filter_words_after_cursor",
      --   visualizer = "hint_start",
      --   action = "jump",
      --   map = true,
      --   modes = { "n", "x" },
      -- })
      -- require("smart-motion").motions.register("drw", {
      --   collector = "lines",
      --   extractor = "words",
      --   filter = "default",
      --   visualizer = "hint_start",
      --   action = "remote_delete",
      --   map = true,
      --   modes = { "n" },
      -- })
    end,
  },
  {
    "folke/flash.nvim",
    enabled = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      modes = {
        search = { enabled = true },
        treesitter = { labels = "abefghijklmnopqrstuvwz" },
        char = {
          enabled = true,
          jump_labels = true,
          char_actions = function(motion)
            return {
              [motion] = "next",
              [motion:match("%l") and motion:upper() or motion:lower()] = "prev",
            }
          end,
          config = function(opts)
            -- autohide flash when in operator-pending mode
            opts.autohide = opts.autohide or (vim.fn.mode(true):find("no") and vim.v.operator == "y")

            -- disable jump labels when not enabled, when using a count,
            -- or when recording/executing registers
            opts.jump_labels = opts.jump_labels
              and vim.v.count == 0
              and vim.fn.reg_executing() == ""
              and vim.fn.reg_recording() == ""

            -- Show jump labels only in operator-pending mode
            -- opts.jump_labels = vim.v.count == 0 and vim.fn.mode(true):find("o")
          end,
        },
      },
    },
    keys = {
      {
        "<C-n>",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter({
            actions = {
              ["<C-n>"] = "next",
              ["<C-p>"] = "prev",
            },
          })
        end,
      },
      -- {
      --   "<leader>j",
      --   mode = "n",
      --   function()
      --     require("flash").jump({
      --       search = { mode = "search", max_length = 0 },
      --       label = { after = { 0, 0 } },
      --       pattern = "^",
      --     })
      --   end,
      --   desc = "Jump to line",
      -- },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x", "n" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Flash Treesitter",
      },
      {
        "s",
        mode = { "n" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "z",
        mode = { "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n" },
        -- function() require("flash").treesitter() end,
        function()
          require("flash").jump({ continue = true })
        end,
        desc = "Flash Treesitter",
      },
      {
        "Z",
        mode = { "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
    },
  },
  {
    "ggandor/leap.nvim",
    enabled = false,
    event = "VeryLazy",
    dependencies = {
      {
        "ggandor/flit.nvim",
        config = true,
      },
    },
    keys = {
      { "s", "<Plug>(leap-forward)", desc = "" },
      { "S", "<Plug>(leap-backward)", desc = "" },
      { "z", "<Plug>(leap-forward)", desc = "", mode = "x" },
      { "Z", "<Plug>(leap-backward)", desc = "", mode = "x" },
      { "x", "<Plug>(leap-forward-x)", desc = "", mode = "x" },
      { "X", "<Plug>(leap-backward-x)", desc = "", mode = "x" },
      { "z", "<Plug>(leap-forward)", desc = "", mode = "o" },
      { "Z", "<Plug>(leap-backward)", desc = "", mode = "o" },
      { "x", "<Plug>(leap-forward-x)", desc = "", mode = "o" },
      { "X", "<Plug>(leap-backward-x)", desc = "", mode = "o" },
    },
    config = true,
  },
}
