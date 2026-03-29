return {
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    keys = {
      { "<leader>M", "<cmd>Mason<cr>", desc = "Mason" },
    },
    cmd = "Mason",
    config = true,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = require("plugins.lsp.dependencies"),
    event = { "BufReadPre", "BufNewFile" },
    init = function()
      local lsp = vim.api.nvim_create_augroup("lsp", { clear = true })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = lsp,
        -- callback = M.on_attach,
        callback = function(ev)
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          require("plugins.lsp.util").on_attach(client, ev.buf)
        end,
      })
    end,
    keys = {
      { "<leader>E", vim.diagnostic.open_float, desc = "Diagnostics open float" },
      { "<leader>lq", vim.diagnostic.setloclist, desc = "Set loclist" },
      {
        "]e",
        function()
          vim.diagnostic.jump({
            count = 1,
            on_jump = function()
              vim.diagnostic.open_float()
            end,
          })
        end,
      },
      {
        "[e",
        function()
          vim.diagnostic.jump({
            count = -1,
            on_jump = function()
              vim.diagnostic.open_float()
            end,
          })
        end,
      },
    },
    config = function()
      -- local lc = require("lspconfig")
      -- local util = require("lspconfig.util")
      -- local my_util = require("plugins.lsp.util")
      -- local capabilities = my_util.capabilities

      -- vim.lsp.enable("lua_ls")
      vim.lsp.enable({ "emmylua_ls" })
      vim.lsp.enable("fennel_language_server")
      vim.lsp.enable("vimls")

      vim.lsp.enable("texlab")
      vim.lsp.enable("tinymist")
      vim.lsp.enable("marksman")

      vim.lsp.enable("r_language_server")
      vim.lsp.enable("ty")
      -- vim.lsp.enable("ruff")

      vim.lsp.enable("html")
      vim.lsp.enable("emmet_ls")
      -- vim.lsp.enable("ts_ls")
      vim.lsp.enable("tsgo")
      vim.lsp.enable("cssls")
      vim.lsp.enable("jsonls")

      vim.lsp.enable("fish_lsp")
      vim.lsp.enable("nushell")
      vim.lsp.enable("bashls")
      vim.lsp.enable("harper_ls")
      vim.lsp.enable("clangd")

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client == nil then
            return
          end
          if client.name == "ruff" then
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false
          end
        end,
        desc = "LSP: Disable hover capability from Ruff",
      })
    end,
  },
}
