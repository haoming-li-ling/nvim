return {
  {
    "saghen/blink.cmp",
    enabled = true,
    -- lazy = false, -- lazy loading handled internally
    -- optional: provides snippets for the snippet source
    event = "InsertEnter",
    version = "1.*",
    dependencies = {
      "erooke/blink-cmp-latex",
      "jmbuhr/cmp-pandoc-references",
    },

    -- use a release tag to download pre-built binaries
    -- version = "v0.*",
    -- OR build from source, requires nightly:
    -- https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = "cargo build --release",
    -- On musl libc based systems you need to add this flag
    -- build = 'RUSTFLAGS="-C target-feature=-crt-static" cargo build --release',

    opts = {
      enabled = function()
        return not vim.tbl_contains({ "typr", "snacks_picker_input" }, vim.bo.filetype)
      end,
      snippets = { preset = "luasnip" },
      completion = {
        list = {
          selection = { auto_insert = true, preselect = false },
        },
        menu = {
          draw = {
            columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "kind" } },
            -- columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
          },
        },
      },
      sources = {
        default = {
          -- "luasnip",
          -- "snippets",
          "latex",
          "lsp",
          "path",
          "buffer",
          -- "omni",
          "lazydev",
          "references",
        },
        providers = {
          references = {
            name = "pandoc_references",
            module = "cmp-pandoc-references.blink",
          },
          latex = {
            name = "Latex",
            module = "blink-cmp-latex",
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
            fallbacks = { "lsp" },
          },
        },
      },
      keymap = {
        ["<C-'>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide" },
        ["<CR>"] = { "accept", "fallback" },
        -- ['<C-y>'] = { 'select_and_accept' },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },

        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
        ["<c-y>"] = {},
        ["<Tab>"] = {},
        -- ["<S-Tab>"] = { "snippet_backward", "fallback" },

        -- ["<C-l>"] = { "snippet_forward", "fallback" },
        -- ["<C-h>"] = { "snippet_backward", "fallback" },
      },
      appearance = {
        nerd_font_variant = "mono",
        use_nvim_cmp_as_default = true,
      },
    },
  },
  {
    "saghen/blink.indent",
    event = "VeryLazy",
    --- @module 'blink.indent'
    --- @type blink.indent.Config
    opts = {},
  },
  {
    "saghen/blink.compat",
    enabled = false,
    opts = {
      impersonate_nvim_cmp = true,
      enable_events = true,
    },
  },
}
