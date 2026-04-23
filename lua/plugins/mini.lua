vim.pack.add({
  "https://github.com/nvim-mini/mini.nvim",
})

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

vim.keymap.set("n", "<leader>bk", function()
  require("mini.bufremove").delete()
end, {})
vim.keymap.set("n", "<leader>bK", function()
  require("mini.bufremove").delete(0, true)
end, {})
require("mini.bufremove").setup()

require("mini.misc").setup_termbg_sync()
require("mini.misc").setup_auto_root({ ".git", "Makefile", ".luarc.json", "config.fish" })

vim.keymap.set("n", "<M-S-w>", "<cmd>normal gxiwgxinw<cr>", {})
vim.keymap.set("n", "<M-S-b>", "<cmd>normal gxiwgxilw<cr>", {})

require("mini.operators").setup({
  replace = {
    prefix = "gh",
  },
  sort = {
    prefix = "",
  },
})

require("mini.surround").setup({
  highlight_duration = 500,
  mappings = {
    add = "ys",
    delete = "ds",
    find = "",
    find_left = "",
    highlight = "",
    replace = "cs",
    suffix_last = "l",
    suffix_next = "n",
    update_n_lines = "",
  },
  n_lines = 20,
  respect_selection_type = false,
  search_method = "cover",
  silent = false,
})

vim.keymap.del("x", "ys")
vim.keymap.set("x", "S", [[:<C-u>lua MiniSurround.add('visual')<CR>]], { silent = true })

require("mini.icons").setup()

vim.keymap.set("n", "-", function()
  require("mini.files").open(vim.api.nvim_buf_get_name(0), false)
  require("mini.files").reveal_cwd()
end, { desc = "Open Mini.Files" })

local files = require("mini.files")
files.setup({
  mappings = {
    go_in = "L",
    go_in_plus = "<cr>",
    go_out = "H",
    go_out_plus = "<bs>",
    reset = "0",
  },
  options = {
    use_as_default_explorer = false,
  },
  windows = {
    preview = true,
    width_preview = 30,
  },
})

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

vim.keymap.set(
  "n",
  "<leader>ga",
  "ViegAs\\[a-z]*%*?%b{}<cr><cr>=ae",
  { desc = "Align tableau", silent = true, noremap = false }
)

local align = require("mini.align")
align.setup({
  options = { merge_delimiter = " " },
  steps = { pre_justify = { align.gen_step.trim() } },
})

require("mini.comment").setup({
  hooks = {
    post = function() end,
    pre = function() end,
  },
  mappings = {
    comment = "",
    comment_line = "",
    textobject = "gc",
  },
})
