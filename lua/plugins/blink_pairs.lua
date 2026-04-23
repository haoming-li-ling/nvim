vim.pack.add({
  { src = "https://github.com/saghen/blink.pairs", version = vim.version.range("0.1 - 1.0") },
  "https://github.com/saghen/blink.download",
})
require("blink-pairs").setup({})
