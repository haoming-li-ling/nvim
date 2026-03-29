return {
  {
    "hat0uma/csvview.nvim",
    ---@module "csvview"
    ---@type CsvView.Options
    opts = {
      parser = { comments = { "#", "//" } },
      keymaps = {
        -- Text objects for selecting fields
        textobject_field_inner = { "if", mode = { "o", "x" } },
        textobject_field_outer = { "af", mode = { "o", "x" } },
        -- Excel-like navigation:
        -- Use <Tab> and <S-Tab> to move horizontally between fields.
        -- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
        -- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
        jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
        jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
        jump_next_row = { "<Enter>", mode = { "n", "v" } },
        jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
      },
    },
    cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
  },
  {
    "sontungexpt/vietnamese.nvim",
    enabled = false,
    dependencies = {
      -- if you want to map jj or any key to escape
      "sontungexpt/bim.nvim",
    },
    event = "InsertEnter",
    config = function()
      require("vietnamese").setup()
    end,
  },
  { "MagicDuck/grug-far.nvim", opts = {} },
  { "gbprod/stay-in-place.nvim", event = "VeryLazy", opts = {} },
  { "folke/ts-comments.nvim", opts = {}, event = "VeryLazy" },
  {
    "ThePrimeagen/refactoring.nvim",
    keys = {
      {
        "<leader>rv",
        ":Refactor extract_var ",
        mode = "x",
        desc = "Extract variable",
      },
      {
        "<leader>ri",
        ":Refactor inline_var",
        mode = { "n", "x" },
        desc = "Inline variable",
      },
    },
    opts = {},
  },
  {
    "chrisgrieser/nvim-recorder",
    -- keys = { "q", "Q" },
    event = "VeryLazy",
    opts = {
      slots = { "a", "b" },
      mapping = {
        startStopRecording = "q",
        playMacro = "Q",
        switchSlot = "<M-q>",
        editMacro = "cq",
        deleteAllMacros = "dq",
        yankMacro = "yq",
        -- ⚠️ this should be a string you don't use in insert mode during a macro
        addBreakPoint = "##",
      },
    },
  },
  {
    "monaqa/dial.nvim",
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:on_filetype({
        lua = {
          augend.integer.alias.decimal,
          augend.constant.new({
            elements = { "true", "false" },
            word = true,
            cyclic = true,
          }),
          augend.constant.new({
            elements = { "and", "or" },
            word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
            cyclic = true, -- "or" is incremented into "and".
          }),
        },
        tex = {
          -- uppercase hex number (0x1A1A, 0xEEFE, etc.)
          augend.integer.alias.decimal,
          augend.constant.new({
            elements = { "&&", "||" },
            word = false,
            cyclic = true,
          }),
          augend.constant.new({ word = false, cyclic = true, elements = { "subset", "subseteq" } }),
          augend.constant.new({ word = false, cyclic = true, elements = { "subseteq", "subset" } }),
          augend.constant.new({ word = false, cyclic = true, elements = { "sqsubset", "sqsubseteq" } }),
          augend.constant.new({ word = false, cyclic = true, elements = { "sqsubseteq", "sqsubset" } }),
          augend.constant.new({ word = false, cyclic = true, elements = { "supset", "supseteq" } }),
          augend.constant.new({ word = false, cyclic = true, elements = { "supseteq", "supset" } }),
          augend.constant.new({ word = false, cyclic = true, elements = { "sqsupset", "sqsupseteq" } }),
          augend.constant.new({ word = false, cyclic = true, elements = { "sqsupseteq", "sqsupset" } }),
          augend.constant.new({ word = false, cyclic = true, elements = { "phi", "varphi" } }),
          augend.constant.new({ word = false, cyclic = true, elements = { "varphi", "phi" } }),
          augend.constant.new({ word = false, cyclic = true, elements = { "epsilon", "varepsilon" } }),
          augend.constant.new({ word = false, cyclic = true, elements = { "varepsilon", "epsilon" } }),
        },
      })
    end,
    keys = {
      {
        "<C-a>",
        function()
          require("dial.map").manipulate("increment", "normal")
        end,
        mode = { "n" },
      },
      {
        "<C-x>",
        function()
          require("dial.map").manipulate("decrement", "normal")
        end,
        mode = { "n" },
      },
      {
        "g<C-a>",
        function()
          require("dial.map").manipulate("increment", "gnormal")
        end,
        mode = { "n" },
      },
      {
        "g<C-x>",
        function()
          require("dial.map").manipulate("decrement", "gnormal")
        end,
        mode = { "n" },
      },
      {
        "<C-a>",
        function()
          require("dial.map").manipulate("increment", "visual")
        end,
        mode = { "v" },
      },
      {
        "<C-x>",
        function()
          require("dial.map").manipulate("decrement", "visual")
        end,
        mode = { "v" },
      },
      {
        "g<C-a>",
        function()
          require("dial.map").manipulate("increment", "gvisual")
        end,
        mode = { "v" },
      },
      {
        "g<C-x>",
        function()
          require("dial.map").manipulate("decrement", "gvisual")
        end,
        mode = { "v" },
      },
    },
  },
  {
    "keaising/im-select.nvim",
    enabled = true,
    event = "VeryLazy",
    opts = {
      default_im_select = "com.apple.keylayout.ABC",
    },
  },

  {
    "tpope/vim-repeat",
    enabled = true,
    event = "VeryLazy",
  },
  {
    "inkarkat/vim-visualrepeat",
  },

  {
    "wellle/targets.vim",
    event = "VeryLazy",
  },
}
