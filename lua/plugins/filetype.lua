return {
  {
    "DrKJeff16/wezterm-types",
    version = false, -- Get the latest version
  },
  {
    "fladson/vim-kitty",
    ft = "kitty",
    -- tag = "*", -- You can select a tagged version
  },
  {
    "gpanders/nvim-parinfer",
    init = function()
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
    end,
    -- event = "InsertEnter",
  },
  { "LhKipp/nvim-nu", build = ":TSInstall nu", ft = "nu" },
  {
    "vim-pandoc/vim-pandoc-syntax",
    -- ft = "pandoc",
    enabled = false,
    dependencies = {
      "vim-pandoc/vim-pandoc",
    },
    -- config = function()
    --   vim.cmd([[
    --   augroup pandoc_syntax
    --     " au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
    --     au! BufNewFile,BufFilePre,BufRead *.md runtime syntax/pandoc.vim
    --   augroup END]])
    -- end,
  },
  {
    "preservim/vim-markdown",
    enabled = false,
    init = function()
      vim.g.vim_markdown_math = 1
    end,
  },
  {
    "martineausimon/nvim-lilypond-suite",
    enabled = false,
    ft = "lilypond",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require("nvls").setup({
        lilypond = {
          mappings = {
            player = "<F3>",
            compile = "<F5>",
            open_pdf = "<F6>",
            switch_buffers = "<A-Space>",
            insert_version = "<F4>",
            hyphenation = "<F12>",
            hyphenation_change_lang = "<F11>",
            insert_hyphen = "<leader>ih",
            add_hyphen = "<leader>ah",
            del_next_hyphen = "<leader>dh",
            del_prev_hyphen = "<leader>dH",
            del_selected_hyphen = "<leader>dh",
          },
          options = {
            pitches_language = "default",
            output = "pdf",
            main_file = "main.ly",
            main_folder = "%:p:h",
            include_dir = "$HOME",
            hyphenation_language = "en_DEFAULT",
          },
        },
        latex = {
          mappings = {
            compile = "<F5>",
            open_pdf = "<F6>",
            lilypond_syntax = "<F3>",
          },
          options = {
            clean_logs = false,
          },
        },
        player = {
          mappings = {
            quit = "q",
            play_pause = "p",
            loop = "<A-l>",
            backward = "h",
            small_backward = "<S-h>",
            forward = "l",
            small_forward = "<S-l>",
            decrease_speed = "j",
            increase_speed = "k",
            halve_speed = "<S-j>",
            double_speed = "<S-k>",
          },
          options = {
            row = "2%",
            col = "99%",
            width = "37",
            height = "1",
            border_style = "single",
            winhighlight = "Normal:Normal,FloatBorder:Normal",
            mpv_flags = {
              "--msg-level=cplayer=no,ffmpeg=no",
              "--loop",
              "--config-dir=/dev/null",
            },
          },
        },
      })
    end,
  },
  {
    "jez/vim-better-sml",
    enabled = false,
    ft = "sml",
    config = function()
      vim.g.sml_auto_create_def_use = "always"
      vim.g.sml_smlnj_executable = "/usr/local/smlnj/bin/sml"
      -- local t = require("util").replace_termcodes
      local wk = require("which-key")
      local vimbettersml = vim.api.nvim_create_augroup("vimbettersml", { clear = true })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "sml",
        callback = function()
          require("which-key").add({
            gd = { ":SMLJumpToDef<CR>", "Jump to Definition" },
            ["<leader>"] = {
              m = {
                name = "+sml",
                t = { ":SMLTypeQuery<cr>", "Type Query" },
                s = { ":SMLReplStart<cr>", "REPL Start" },
                k = { ":SMLReplStop<cr>", "REPL Stop" },
                b = { ":SMLReplBuild<cr>", "REPL Build" },
                u = { ":SMLReplOpen<cr>", "REPL Open" },
                c = { ":SMLReplClear<cr>", "REPL Clear" },
                p = { ":SMLReplPrintDepth<cr>", "REPL Print Depth" },
              },
            },
          }, { buffer = 0 })
          vim.g.sml_greek_tyvar_show_tick = 1
        end,
        group = vimbettersml,
      })
      -- vim.api.nvim_create_autocmd("FileType", {
      --   pattern = "sml",
      --   callback = function()
      --     wk.register({
      --       ["<tab>"] = { t("pumvisible() ? '<C-n>' : '<TAB>'"), "Tab Completion" },
      --       ["<s-tab>"] = { t("pumvisible() ? '<C-n>' : '<TAB>'"), "Tab Completion" },
      --     }, { mode = "i", expr = true })
      --   end,
      -- })
    end,
  },

  {
    "nvim-orgmode/orgmode",
    ft = "org",
    opts = {
      org_agenda_files = {
        "~/Documents/agenda/*",
      },
      org_default_notes_file = "~/Documents/org-roam/20220709153906-random_notes.org",
    },
  },
  {
    "dense-analysis/ale",
    enabled = false,
    ft = "sml",
  },
  {
    "xolox/vim-notes",
    ft = "markdown",
    enabled = false,
  },
  {
    "othree/html5.vim",
    enabled = false,
    ft = { "html", "css" },
  },
  {
    "tpope/vim-liquid",
    enabled = false,
    ft = { "liquid" },
  },
}
