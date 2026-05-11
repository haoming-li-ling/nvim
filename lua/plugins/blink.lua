vim.pack.add({
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.0 - 2.0") },
  "https://github.com/erooke/blink-cmp-latex",
})

require("blink.cmp").setup({
  appearance = {
    nerd_font_variant = "mono",
    use_nvim_cmp_as_default = true,
  },
  completion = {
    list = {
      selection = {
        auto_insert = true,
        preselect = false,
      },
    },
    menu = {
      draw = {
        columns = {
          {
            "kind_icon",
          },
          {
            "label",
            "label_description",
            gap = 1,
          },
          {
            "kind",
          },
        },
      },
    },
  },
  enabled = function()
    return not vim.tbl_contains({ "typr", "snacks_picker_input" }, vim.bo.filetype)
  end,
  keymap = {
    ["<C-'>"] = {
      "show",
      "show_documentation",
      "hide_documentation",
    },
    ["<C-b>"] = {
      "scroll_documentation_up",
      "fallback",
    },
    ["<C-e>"] = {
      "hide",
    },
    ["<C-f>"] = {
      "scroll_documentation_down",
      "fallback",
    },
    ["<C-n>"] = {
      "select_next",
      "fallback",
    },
    ["<C-p>"] = {
      "select_prev",
      "fallback",
    },
    ["<CR>"] = {
      "accept",
      "fallback",
    },
    ["<Tab>"] = {},
    ["<c-y>"] = {},
  },
  snippets = {
    preset = "luasnip",
  },
  sources = {
    default = {
      "lazydev",
      "latex",
      "lsp",
      "path",
      "buffer",
      -- "references",
    },
    providers = {
      latex = {
        module = "blink-cmp-latex",
        name = "Latex",
        opts = {
          insert_command = function(ctx)
            local ft = vim.api.nvim_get_option_value("filetype", {
              scope = "local",
              buf = ctx.bufnr,
            })
            if ft == "tex" and not vim.b[ctx.bufnr].latex_symbol then
              return true
            end
            return false
          end,
        },
      },
      lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        score_offset = 100,
        fallbacks = {
          "lsp",
        },
      },
      -- references = {
      --   module = "cmp-pandoc-references.blink",
      --   name = "pandoc_references",
      -- },
    },
  },
})
