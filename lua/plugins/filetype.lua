vim.pack.add({
  "https://github.com/DrKJeff16/wezterm-types",
  --   "https://github.com/fladson/vim-kitty",
  "https://github.com/gpanders/nvim-parinfer",
  --   "https://github.com/LhKipp/nvim-nu",
  --   "https://github.com/vim-pandoc/vim-pandoc-syntax",
  --   "https://github.com/vim-pandoc/vim-pandoc",
  --   "https://github.com/preservim/vim-markdown",
  --   "https://github.com/martineausimon/nvim-lilypond-suite",
  --   "https://github.com/MunifTanjim/nui.nvim",
  --   "https://github.com/jez/vim-better-sml",
  --   "https://github.com/nvim-orgmode/orgmode",
  --   "https://github.com/dense-analysis/ale",
  --   "https://github.com/xolox/vim-notes",
  --   "https://github.com/othree/html5.vim",
  --   "https://github.com/tpope/vim-liquid",
})

vim.g.parinfer_filetypes = {
  "clojure",
  "scheme",
  "lisp",
  "racket",
  "hy",
  "fennel",
  "janet",
  "carp",
  "wast",
  "yuck",
  "dune",
  "query",
}

-- local _opts = {
--   org_agenda_files = {
--     "~/Documents/agenda/*",
-- },
--   org_default_notes_file = "~/Documents/org-roam/20220709153906-random_notes.org",
-- }
-- do
--   local _ok, _plugin = pcall(require, "orgmode")
--   if _ok and type(_plugin) == "table" and type(_plugin.setup) == "function" then
--     _plugin.setup(_opts or {})
--   end
-- end
