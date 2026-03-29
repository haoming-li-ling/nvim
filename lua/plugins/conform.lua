return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        python = {
          "ruff_fix",
          "ruff_format",
          "ruff_organize_imports",
        },
        lua = { "stylua" },
        fennel = { "fnlfmt" },
        toml = { "taplo" },
        javascript = { "biome" },
        json = { "biome" },
        tex = { "latexindent" },
      },
      format_on_save = function(bufnr)
        local ignore_filetypes = { "tex" }
        if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
          return
        end

        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end

        return { timeout_ms = 700, quiet = true, lsp_fallback = false }
      end,
    },
  },
}
