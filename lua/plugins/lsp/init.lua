vim.pack.add({
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/neovim/nvim-lspconfig",
})
require("plugins.lsp.dependencies")

vim.keymap.set("n", "<leader>M", "<cmd>Mason<cr>", { desc = "Mason" })

require("mason").setup({})

local lsp = vim.api.nvim_create_augroup("lsp", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
  group = lsp,
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    require("plugins.lsp.util").on_attach(client, ev.buf)
  end,
})

vim.keymap.set("n", "<leader>E", vim.diagnostic.open_float, { desc = "Diagnostics open float" })
vim.keymap.set("n", "<leader>lq", vim.diagnostic.setloclist, { desc = "Set loclist" })
vim.keymap.set("n", "]e", function()
  vim.diagnostic.jump({
    count = 1,
    on_jump = function()
      vim.diagnostic.open_float()
    end,
  })
end)
vim.keymap.set("n", "[e", function()
  vim.diagnostic.jump({
    count = -1,
    on_jump = function()
      vim.diagnostic.open_float()
    end,
  })
end)

vim.lsp.enable({ "emmylua_ls" })
-- vim.lsp.enable("lua_ls")
vim.lsp.enable("fennel_language_server")
vim.lsp.enable("vimls")
vim.lsp.enable("texlab")
vim.lsp.enable("tinymist")
vim.lsp.enable("marksman")
vim.lsp.enable("r_language_server")
vim.lsp.enable("ty")
vim.lsp.enable("html")
vim.lsp.enable("emmet_ls")
vim.lsp.enable("tsgo")
vim.lsp.enable("cssls")
vim.lsp.enable("jsonls")
vim.lsp.enable("fish_lsp")
vim.lsp.enable("nushell")
vim.lsp.enable("bashls")
vim.lsp.enable("harper_ls")
vim.lsp.enable("clangd")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("tombi")

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "ruff" then
      client.server_capabilities.hoverProvider = false
    end
  end,
  desc = "LSP: Disable hover capability from Ruff",
})
