return {
  {
    "nvim-mini/mini.hipatterns",
    version = false,
    ft = { "yaml", "json", "toml" },
    config = function()
      local hipat = require("mini.hipatterns")
      hipat.setup({
        highlighters = {
          -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
          fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
          hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
          todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
          note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = hipat.gen_highlighter.hex_color(),
        },
      })
    end,
  },
  {
    "nvim-mini/mini.statusline",
    enabled = false,
    version = false,
    event = "VeryLazy",
    opts = {},
  },
  {
    "nvim-mini/mini.bufremove",
    version = false,
    opts = {},
    keys = {
      {
        "<leader>bk",
        function()
          require("mini.bufremove").delete()
        end,
      },
      {
        "<leader>bK",
        function()
          require("mini.bufremove").delete(0, true)
        end,
      },
    },
  },
  {
    "nvim-mini/mini.misc",
    event = "VeryLazy",
    version = false,
    config = function()
      require("mini.misc").setup_termbg_sync()
      require("mini.misc").setup_auto_root({ ".git", "Makefile", ".luarc.json", "config.fish" })
    end,
  },
  {
    "nvim-mini/mini.operators",
    version = false,
    event = "VeryLazy",
    keys = {
      { "gx" },
      { "g=" },
      { "gm" },
      { "gh" },
      -- { "gs" },
      -- { "<M-S-l>", "<cmd>normal gxiagxina<cr>" },
      -- { "<M-S-h>", "<cmd>normal gxiagxila<cr>" },
      { "<M-S-w>", "<cmd>normal gxiwgxinw<cr>" },
      { "<M-S-b>", "<cmd>normal gxiwgxilw<cr>" },
    },
    opts = {
      replace = {
        prefix = "gh",
      },
      sort = {
        prefix = "",
      },
    },
  },
  {
    "nvim-mini/mini.surround",
    keys = {
      { "ds" },
      { "ys" },
      { "cs" },
      { "S", mode = "x" },
    },
    opts = {
      -- Add custom surroundings to be used on top of builtin ones. For more
      -- information with examples, see `:h MiniSurround.config`.
      custom_surroundings = nil,

      -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
      highlight_duration = 500,

      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        add = "ys", -- Add surrounding in Normal and Visual modes
        delete = "ds", -- Delete surrounding
        find = "", -- Find surrounding (to the right)
        find_left = "", -- Find surrounding (to the left)
        highlight = "", -- Highlight surrounding
        replace = "cs", -- Replace surrounding
        update_n_lines = "", -- Update `n_lines`

        suffix_last = "l", -- Suffix to search with "prev" method
        suffix_next = "n", -- Suffix to search with "next" method
      },

      -- Number of lines within which surrounding is searched
      n_lines = 20,

      -- Whether to respect selection type:
      -- - Place surroundings on separate lines in linewise mode.
      -- - Place surroundings on each line in blockwise mode.
      respect_selection_type = false,

      -- How to search for surrounding (first inside current line, then inside
      -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
      -- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
      -- see `:h MiniSurround.config`.
      search_method = "cover",

      -- Whether to disable showing non-error feedback
      -- This also affects (purely informational) helper messages shown after
      -- idle time if user input is required.
      silent = false,
    },
    config = function(_, opts)
      require("mini.surround").setup(opts)

      vim.keymap.del("x", "ys")
      vim.keymap.set("x", "S", [[:<C-u>lua MiniSurround.add('visual')<CR>]], { silent = true })
    end,
  },
  {
    "nvim-mini/mini.icons",
    opts = {},
    lazy = true,
    specs = {
      { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
    },
    -- init = function()
    -- 	package.preload["nvim-web-devicons"] = function()
    -- 		-- needed since it will be false when loading and mini will fail
    -- 		package.loaded["nvim-web-devicons"] = {}
    -- 		require("mini.icons").mock_nvim_web_devicons()
    -- 		return package.loaded["nvim-web-devicons"]
    -- 	end
    -- end,
  },
  {
    "nvim-mini/mini.indentscope",
    enabled = false,
    version = false,
    event = "VeryLazy",
    config = function()
      require("mini.indentscope").setup({
        -- Draw options
        draw = {
          -- Delay (in ms) between event and start of drawing scope indicator
          delay = 0,
          -- Animation rule for scope's first drawing. A function which, given
          -- next and total step numbers, returns wait time (in ms). See
          -- |MiniIndentscope.gen_animation| for builtin options. To disable
          -- animation, use `require('mini.indentscope').gen_animation.none()`.
          animation = require("mini.indentscope").gen_animation.none(),

          -- Symbol priority. Increase to display on top of more symbols.
          priority = 2,
        },

        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
          -- Textobjects
          object_scope = "ii",
          object_scope_with_border = "ai",

          -- Motions (jump to respective border line; if not present - body line)
          goto_top = "[i",
          goto_bottom = "]i",
        },

        -- Options which control scope computation
        options = {
          -- Type of scope's border: which line(s) with smaller indent to
          -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
          border = "both",

          -- Whether to use cursor column when computing reference indent.
          -- Useful to see incremental scopes with horizontal cursor movements.
          indent_at_cursor = true,

          -- Whether to first check input line to be a border of adjacent scope.
          -- Use it if you want to place cursor on function header to get scope of
          -- its body.
          try_as_border = false,
        },

        -- Which character to use for drawing scope indicator
        symbol = "╎",
        -- symbol = "│",
      })
    end,
  },
  {
    "nvim-mini/mini.clue",
    enabled = vim.g.whichkey == false,
    -- enabled = false,
    version = false,
    event = "VeryLazy",
    config = function()
      local clue = require("mini.clue")
      local leaderw_clues = vim.tbl_map(function(x)
        x.keys = x.keys:gsub("^<C%-w>", "<Leader>w")
        return x
      end, clue.gen_clues.windows())

      clue.setup({
        triggers = {
          -- Leader triggers
          { mode = "n", keys = "<Leader>" },
          { mode = "x", keys = "<Leader>" },

          -- Built-in completion
          { mode = "i", keys = "<C-x>" },

          -- `g` key
          { mode = "n", keys = "g" },
          { mode = "x", keys = "g" },

          -- Marks
          { mode = "n", keys = "'" },
          { mode = "n", keys = "`" },
          { mode = "x", keys = "'" },
          { mode = "x", keys = "`" },

          -- Registers
          { mode = "n", keys = '"' },
          { mode = "x", keys = '"' },
          { mode = "i", keys = "<C-r>" },
          { mode = "c", keys = "<C-r>" },

          -- Window commands
          { mode = "n", keys = "<C-w>" },

          -- `z` key
          { mode = "n", keys = "z" },
          { mode = "x", keys = "z" },
          { mode = "n", keys = "[" },
          { mode = "n", keys = "]" },
        },
        clues = {
          { mode = "n", keys = "<leader>w", desc = "+window" },
          leaderw_clues,
          { mode = "n", keys = "<leader>b", desc = "+buffer" },
          { mode = "n", keys = "<leader>c", desc = "+code" },
          { mode = "n", keys = "<leader>d", desc = "+multicursor" },
          { mode = "n", keys = "<leader>f", desc = "+file" },
          { mode = "n", keys = "<leader>g", desc = "+align" },
          { mode = "n", keys = "<leader>h", desc = "+help" },
          { mode = "n", keys = "<leader>i", desc = "+swap" },
          { mode = "n", keys = "<leader>l", desc = "+lsp" },
          { mode = "n", keys = "<leader>m", desc = "+commands" },
          { mode = "n", keys = "<leader>n", desc = "+node" },
          { mode = "n", keys = "<leader>p", desc = "+project" },
          { mode = "n", keys = "<leader>q", desc = "+quit" },
          { mode = "n", keys = "<leader>r", desc = "+refactor" },
          { mode = "n", keys = "<leader>s", desc = "+search" },
          { mode = "n", keys = "<leader>x", desc = "+diagnostics" },
          { mode = "n", keys = "<leader>y", desc = "+snippet" },
          -- Enhance this by adding descriptions for <Leader> mapping groups
          clue.gen_clues.builtin_completion(),
          clue.gen_clues.g(),
          clue.gen_clues.marks(),
          clue.gen_clues.registers(),
          clue.gen_clues.windows(),
          clue.gen_clues.z(),
        },
        window = {
          delay = 400,
        },
      })
    end,
  },
  { "nvim-mini/mini.pairs", enabled = false, version = false, opts = {} },
  {
    "nvim-mini/mini.files",
    -- enabled = false,
    lazy = false,
    -- event = "BufEnter",
    version = false,
    keys = {
      {
        "-",
        -- "<cmd>lua MiniFiles.open()<cr>",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), false)
          require("mini.files").reveal_cwd()
        end,
        desc = "Open Mini.Files",
      },
    },
    opts = {
      options = {
        use_as_default_explorer = false,
      },
      windows = { preview = true, width_preview = 30 },
      mappings = {
        go_in = "L",
        go_out = "H",
        go_in_plus = "<cr>",
        go_out_plus = "<bs>",
        reset = "0",
      },
    },
    config = function(_, opts)
      local files = require("mini.files")
      files.setup(opts)
      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          local buf_id = args.data.buf_id
          -- Tweak left-hand side of mapping to your liking
          -- vim.keymap.set("n", "<c-l>", function()
          -- 	files.go_in()
          -- end, { buffer = buf_id })
          vim.keymap.set("n", "-", function()
            files.go_out()
          end, { buffer = buf_id })
          vim.keymap.set("n", "J", "j", { buffer = buf_id })
          vim.keymap.set("n", "K", "k", { buffer = buf_id })
          vim.keymap.set("n", "<esc>", function()
            files.close()
          end, { buffer = buf_id })
        end,
      })
    end,
  },
  {
    "nvim-mini/mini.ai",
    version = false,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local ai = require("mini.ai")
      local spec_pair = ai.gen_spec.pair
      local gen_spec = ai.gen_spec
      local spec_treesitter = ai.gen_spec.treesitter
      ai.setup({
        custom_textobjects = {
          a = spec_treesitter({ a = "@parameter.outer", i = "@parameter.inner" }),
          y = spec_treesitter({ a = "@call.outer", i = "@call.inner" }),
          f = spec_treesitter({ a = "@function.outer", i = "@function.inner" }),
          O = spec_treesitter({ a = "@class.outer", i = "@class.inner" }),
          o = spec_treesitter({ a = "@block.outer", i = "@block.inner" }),
          z = spec_treesitter({ a = "@statement.outer", i = "@statement.outer" }),
          -- a = gen_spec.argument({ brackets = { "%b{}", "%b()", "%b[]" } }),
          -- a = spec_treesitter({
          -- 	a = "@parameter.outer",
          -- 	i = "@parameter.inner",
          -- }),
        },
      })
    end,
  },
  {
    "nvim-mini/mini.align",
    version = false,
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      {
        "<leader>ga",
        "ViegAs\\[a-z]*%*?%b{}<cr><cr>=ae",
        desc = "Align tableau",
        remap = true,
        silent = true,
      },
    },
    config = function()
      local align = require("mini.align")
      align.setup({
        options = { merge_delimiter = " " },
        steps = { pre_justify = { align.gen_step.trim() } },
      })
    end,
  },
  {
    "nvim-mini/mini.comment",
    version = false,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      mappings = {
        comment = "",
        comment_line = "",
        textobject = "gc",
      },
      hooks = {
        pre = function() end,
        post = function() end,
      },
    },
  },
  {
    "nvim-mini/mini.starter",
    version = false,
    enabled = false,
    event = "VimEnter",
    config = function()
      local starter = require("mini.starter")
      starter.setup({
        evaluate_single = true,
        items = {
          starter.sections.recent_files(9, false),
          -- starter.sections.recent_files(10, true),
          starter.sections.builtin_actions(),
          -- Use this if you set up 'mini.sessions'
          -- starter.sections.sessions(5, true),
        },
        content_hooks = {
          starter.gen_hook.adding_bullet(),
          starter.gen_hook.indexing("all", { "builtin actions" }),
          starter.gen_hook.padding(3, 2),
        },
      })
    end,
  },
}
