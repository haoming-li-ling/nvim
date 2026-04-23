vim.pack.add({
  "https://github.com/stevearc/conform.nvim",
})

local ignore_filetypes = { "tex" }

require("conform").setup({
  format_on_save = function(bufnr)
    if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
      return
    end

    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end

    return { timeout_ms = 700, quiet = true, lsp_fallback = false }
  end,
  formatters_by_ft = {
    toml = {
      "tombi",
    },
    fennel = {
      "fnlfmt",
    },
    javascript = {
      "biome",
    },
    json = {
      "biome",
    },
    lua = {
      "stylua",
    },
    python = {
      "ruff_fix",
      "ruff_format",
      "ruff_organize_imports",
    },
    tex = {
      "latexindent",
    },
    toml = {
      "taplo",
    },
  },
})
