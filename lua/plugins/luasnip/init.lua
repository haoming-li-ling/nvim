vim.pack.add({
  "https://github.com/L3MON4D3/LuaSnip",
  "https://github.com/rafamadriz/friendly-snippets",
})
vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "LuaSnip" and (kind == "install" or kind == "update") then
      if not ev.data.active then
        vim.cmd.packadd("LuaSnip")
      end
      vim.system({ "make", "install_jsregexp" })
    end
  end,
})

vim.cmd([[command! LuaSnipEdit :lua require("luasnip.loaders").edit_snippet_files()]])
vim.keymap.set("n", "<leader>ye", "<cmd>LuaSnipEdit<cr>", { desc = "Edit Lua snippets" })
vim.keymap.set({ "i", "s" }, "<Tab>", function()
  if require("luasnip").expandable() then
    -- require("luasnip").expand_or_jump()
    return "<Plug>luasnip-expand-snippet"
  else
    return "<Tab>"
    -- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<tab>", true, false, true), "n", false)
  end
end, { expr = true })
vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
  if require("luasnip").jumpable(-1) then
    -- require("luasnip").expand_or_jump()
    return "<Plug>luasnip-jump-prev"
  else
    return "<Tab>"
    -- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<tab>", true, false, true), "n", false)
  end
end, { expr = true })
vim.keymap.set({ "i", "s" }, "<C-l>", function()
  if require("luasnip").jumpable(1) then
    return "<Plug>luasnip-jump-next"
  else
    return "<C-l>"
  end
end, { expr = true })
vim.keymap.set({ "i", "s" }, "<C-h>", function()
  if require("luasnip").jumpable(-1) then
    return "<Plug>luasnip-jump-prev"
  else
    return "<C-h>"
  end
end, { expr = true })
vim.keymap.set({ "i", "s" }, "<C-y>", function()
  if require("luasnip").choice_active() then
    return "<Plug>luasnip-next-choice"
  else
    return "<C-y>"
  end
end, { expr = true })
local types = require("luasnip.util.types")

require("luasnip").config.setup({
  -- update_events = "TextChanged,TextChangedI",
  snip_env = {
    snippet = require("luasnip").snippet,
    sn = require("luasnip").snippet_node,
    isn = require("luasnip").indent_snippet_node,
    t = require("luasnip").text_node,
    i = require("luasnip").insert_node,
    f = require("luasnip").function_node,
    c = require("luasnip").choice_node,
    d = require("luasnip").dynamic_node,
    r = require("luasnip").restore_node,
    events = require("luasnip.util.events"),
    ai = require("luasnip.nodes.absolute_indexer"),
    fmta = require("luasnip.extras.fmt").fmta,
    m = require("luasnip.extras").m,
    l = require("luasnip.extras").l,
    dl = require("luasnip.extras").dynamic_lambda,
    rep = require("luasnip.extras").rep,
    postfix = require("luasnip.extras.postfix").postfix,
    tg = require("plugins.luasnip.util").tg,
    cp = require("plugins.luasnip.util").cp,
    su = require("plugins.luasnip.util").su,
    o = require("plugins.luasnip.util").o,
    vi = require("plugins.luasnip.util").vi,
    ci = require("plugins.luasnip.util").ci,
    vic = require("plugins.luasnip.util").vic,
    leading_white = require("plugins.luasnip.util").leading_white,
    text_mode = require("plugins.luasnip.util").text_mode,
    math_mode = require("plugins.luasnip.util").math_mode,
    rec_ex = require("plugins.luasnip.util").rec_ex,
    rec_exn = require("plugins.luasnip.util").rec_exn,
    rec_gln = require("plugins.luasnip.util").rec_gln,
    gln = require("plugins.luasnip.util").gln,
  },
  load_ft_func = require("luasnip.extras.filetype_functions").extend_load_ft({
    lua = { "lua" },
    tex = { "latex", "tex" },
    latex = { "latex", "tex" },
    quarto = { "latex", "tex", "markdown_inline", "markdown" },
    markdown = {
      "lua",
      "json",
      -- "markdown",
      -- "markdown_inline",
      "latex",
      "tex",
    },
    markdown_inline = {
      -- "markdown",
      -- "markdown_inline",
      "lua",
      "latex",
      "tex",
    },
    html = { "javascript", "html" },
    norg = { "tex", "latex", "lua", "norg" },
  }),
  cut_selection_keys = "<C-q>",
  store_selection_keys = "<Tab>",
  enable_autosnippets = true,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        -- virt_text = { { "●", "GruvboxOrange" } },
        virt_text = { { "●", "Boolean" } },
      },
    },
    [types.insertNode] = {
      active = {
        -- virt_text = { { "●", "GruvboxBlue" } },
        -- virt_text = { { "●", "TSFuncBuiltin" } },
        virt_text = { { "●", "TSFunctionCall" } },
      },
    },
  },
})

require("luasnip.loaders.from_lua").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({
  exclude = { "tex", "latex" },
  -- exclude = {},
})
require("luasnip").filetype_extend("quarto", { "tex", "latex", "markdown", "markdown_line" })
