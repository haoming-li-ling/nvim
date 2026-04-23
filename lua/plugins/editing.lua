vim.pack.add({
  "https://github.com/MagicDuck/grug-far.nvim",
  "https://github.com/gbprod/stay-in-place.nvim",
  "https://github.com/folke/ts-comments.nvim",
  -- "https://github.com/chrisgrieser/nvim-recorder",
  "https://github.com/keaising/im-select.nvim",
  "https://github.com/tpope/vim-repeat",
  -- "https://github.com/inkarkat/vim-visualrepeat",
  "https://github.com/wellle/targets.vim",
})

require("grug-far").setup()

require("stay-in-place").setup()

require("ts-comments").setup()

vim.schedule(function()
  vim.pack.add({
    "https://github.com/lewis6991/async.nvim",
    "https://github.com/ThePrimeagen/refactoring.nvim",
  })

  vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ", { desc = "Extract variable" })
  vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var", { desc = "Inline variable" })
  require("refactoring").setup()
end)

-- require("recorder").setup({
--   mapping = {
--     addBreakPoint = "##",
--     deleteAllMacros = "dq",
--     editMacro = "cq",
--     playMacro = "Q",
--     startStopRecording = "q",
--     switchSlot = "<M-q>",
--     yankMacro = "yq",
--   },
--   slots = {
--     "a",
--     "b",
--   },
-- })
vim.schedule(function()
  vim.pack.add({
    "https://github.com/monaqa/dial.nvim",
  })
  vim.keymap.set({ "n" }, "<C-a>", function()
    require("dial.map").manipulate("increment", "normal")
  end, {})
  vim.keymap.set({ "n" }, "<C-x>", function()
    require("dial.map").manipulate("decrement", "normal")
  end, {})
  vim.keymap.set({ "n" }, "g<C-a>", function()
    require("dial.map").manipulate("increment", "gnormal")
  end, {})
  vim.keymap.set({ "n" }, "g<C-x>", function()
    require("dial.map").manipulate("decrement", "gnormal")
  end, {})
  vim.keymap.set({ "v" }, "<C-a>", function()
    require("dial.map").manipulate("increment", "visual")
  end, {})
  vim.keymap.set({ "v" }, "<C-x>", function()
    require("dial.map").manipulate("decrement", "visual")
  end, {})
  vim.keymap.set({ "v" }, "g<C-a>", function()
    require("dial.map").manipulate("increment", "gvisual")
  end, {})
  vim.keymap.set({ "v" }, "g<C-x>", function()
    require("dial.map").manipulate("decrement", "gvisual")
  end, {})

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
end)

require("im_select").setup({
  default_im_select = "com.apple.keylayout.ABC",
})
