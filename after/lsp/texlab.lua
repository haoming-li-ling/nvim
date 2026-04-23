-- local executable = "sioyek"
-- local args = {
--   "--reuse-window",
--   -- "--execute-command",
--   -- "toggle_synctex", -- Open Sioyek in synctex mode.
--   "--inverse-search",
--   -- [[nvim-texlabconfig -file %%%1 -line %%%2 -server ]]
--   --   .. vim.v.servername,
--   "/Users/haomingli/bin/nvim-texlabconfig -file %%%1 -line %%%2 -cache_root /Users/haomingli/.cache/nvim",
--   "--forward-search-file",
--   "%f",
--   "--forward-search-line",
--   "%l",
-- }
local tectonic = {
  executable = "tectonic",
  args = { "-X", "compile", "%f", "--synctex", "--keep-logs", "--keep-intermediates" },
  forwardSearchAfter = false,
  onSave = false,
}

local latexmk = {
  executable = "latexmk",
  auxDirectory = "./output",
  pdfDirectory = ".",
  args = {
    -- "-lualatex",
    "-shell-escape",
    "-interaction=nonstopmode",
    "-synctex=1",
    -- "-auxdir=./output",
    -- "-outdir=.",
    "%f",
    -- "|",
    -- "tee",
    -- "latexmk.log",
  },
  -- args = {
  -- 	"%f",
  -- 	"-synctex=1",
  -- 	"-interaction=nonstopmode",
  -- 	"-pdf",
  -- 	"-outdir=./output",
  -- },
  forwardSearchAfter = false,
  onSave = false,
}
return {
  -- on_attach = on_attach,
  -- root_dir = util.find_git_ancestor,
  -- capabilities = capabilities,
  settings = {
    texlab = {
      experimental = {
        labelDefinitionCommands = { [[fakelabel]] },
      },
      build = latexmk,
      diagnostics = {
        ignoredPatterns = {
          "Unused label",
          "Unused entry",
          "Duplicate entry key",
        },
      },
      bibtexFormatter = "texlab",
      chktex = {
        onEdit = false,
        onOpenAndSave = false,
      },
      diagnosticsDelay = 300,
      formatterLineLength = 80,
      forwardSearch = {
        executable = "/Applications/Skim.app/Contents/SharedSupport/displayline",
        args = { "-r", "-g", "%l", "%p", "%f" },
      },

      latexFormatter = "latexindent",
      latexindent = {
        modifyLineBreaks = true,
        ["local"] = "/Users/haomingli/.indentconfig.yaml",
      },
    },
  },
}
