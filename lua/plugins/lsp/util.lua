vim.g.symbols_outline = {
  highlight_hovered_item = false,
  auto_preview = false,
  keymaps = { -- These keymaps can be a string or a table for multiple keys
    close = { "<Esc>", "q" },
    goto_location = "<Cr>",
    focus_location = "o",
    hover_symbol = "K",
    toggle_preview = "P",
    rename_symbol = "r",
    code_actions = "a" } }

local M = {}

function M.disable_formatting(client)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false
end

---Format code on save
---@param client any
---@return nil
function M.format_on_save(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    local lsp_format_augroup = vim.api.nvim_create_augroup("lsp_format_augroup", { clear = false })
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      group = lsp_format_augroup,
      callback = function()
        vim.lsp.buf.format({ async = false })
      end })
  end
end

local local_keymaps = {
  -- { "K", vim.lsp.buf.hover, "Hover" },
  -- {
  -- 	"K",
  -- 	"<cmd>Lspsaga hover_doc<cr>",
  -- 	"Hover",
  -- },
  -- { "gD", vim.lsp.buf.declaration, "Goto declaration" },
  -- { "gd", vim.lsp.buf.definition, "Goto definition" },
  -- { "gi", vim.lsp.buf.implementation, "Goto implementation" },
  -- {
  --   "gp",
  --   "<cmd>Lspsaga peek_definition<cr>",
  --   "Preview definition",
  -- },
  -- { "gh", "<cmd>Lspsaga finder<cr>", "LSP Finder" },
  {
    "<leader>rn",
    function()
      return ":IncRename " .. vim.fn.expand("<cword>")
    end,
    desc = "Inc-Rename",
    expr = true },
  {
    "<leader>ln",
    function()
      vim.lsp.buf.selection_range(1)
    end,
    desc = "increment selection",
    mode = { "n", "x" } },
  {
    "<leader>lp",
    function()
      vim.lsp.buf.selection_range(-1)
    end,
    desc = "increment selection",
    mode = { "n", "x" } },
  { "gr", vim.lsp.buf.rename, desc = "LSP rename variable" },
  { "<leader>D", vim.lsp.buf.type_definition, desc = "Goto type definition" },
  { "<leader>ca", vim.lsp.buf.code_action, desc = "Code action", mode = { "n", "x" } },
  {
    "<leader>lf",
    function()
      vim.lsp.buf.format({ async = true })
    end,
    desc = "Format buffer" },
  -- { "<leader>li", "<cmd>LspInfo<CR>", desc = "LSP info" },
  { "<leader>ls", vim.lsp.buf.signature_help, desc = "Buffer signature help" },
  { "<leader>lwa", vim.lsp.buf.add_workspace_folder, desc = "Add workspace folder" },
  {
    "<leader>lwr",
    vim.lsp.buf.remove_workspace_folder,
    desc = "Remove workspace folder" },
  {
    "<leader>lwl",
    function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end,
    desc = "List workspace folders" } }

M.on_attach = function(_client, bufnr)
  -- vim.lsp.inlay_hint.enable()
  vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })
  for _i, v in ipairs(local_keymaps) do
    -- local lhs, rhs, desc, expr, mode = unpack(v)
    local lhs, rhs = unpack(v)
    vim.keymap.set(
      v.mode and v.mode or "n",
      lhs,
      rhs,
      { desc = v.desc, buffer = true, expr = v.expr and v.expr or false }
    )
  end
  -- require("mini.clue").ensure_buf_triggers(bufnr)
end

M.on_attach_callback = function(args)
  M.on_attach(_, args.buf)
end

return M
