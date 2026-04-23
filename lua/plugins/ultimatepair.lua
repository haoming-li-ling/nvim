vim.pack.add({
  "https://github.com/altermo/ultimate-autopair.nvim",
})

require("ultimate-autopair").setup({
  { "`", "'", fly = true, ft = { "tex", "latex" } },
  {
    "\\(",
    "\\)",
    ft = { "tex", "latex" },
    space = true,
    disable_end = true,
    multiline = false,
  },
  {
    "\\[",
    "\\]",
    ft = { "tex", "latex" },
    space = true,
    disable_end = true,
    multiline = false,
  },
  { "`", "'", fly = true, ft = { "tex", "latex" }, multiline = false },
  {
    "\\{",
    "\\}",
    ft = { "tex", "latex" },
    space = true,
    disable_end = true,
    multiline = false,
  },
  -- bs = {
  -- 	enable = true,
  -- },
  -- space2 = {
  -- 	enable = true,
  -- },
  -- space = {
  -- 	enable = true,
  -- },
  cmap = false,
  config_internal_pairs = {
    {
      "[",
      "]",
      fly = true,
      dosuround = true,
      newline = true,
      space = true,
      multiline = false,
    },
    {
      "(",
      ")",
      fly = true,
      dosuround = true,
      newline = true,
      space = true,
      multiline = false,
    },
    {
      "{",
      "}",
      fly = true,
      dosuround = true,
      newline = true,
      space = true,
      multiline = false,
    },
    { '"', '"', suround = true, multiline = false, alpha = { "txt" } },
    {
      "'",
      "'",
      suround = true,
      cond = function(fn)
        return not fn.in_lisp() or fn.in_string()
      end,
      alpha = true,
      nft = { "tex", "latex" },
      multiline = false,
    },
    { "`", "`", nft = { "tex", "latex" }, multiline = false },
    -- { "``", "''", ft = { "tex", "latex" } },
    -- { "```", "```", newline = true, ft = { "markdown" } },
    { "<!--", "-->", ft = { "markdown", "html" } },
    { '"""', '"""', newline = true, ft = { "python" } },
    -- { "'''", "'''", newline = true, ft = { "python" } },
  },
})
