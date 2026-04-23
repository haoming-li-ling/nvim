require("plugins.mini")
local misc = require("mini.misc")
local later = function(f)
  misc.safely("later", f)
end
local on_event = function(ev, f)
  local ev_str = type(ev) == "string" and ev or table.concat(ev, ",")
  misc.safely("event:" .. ev_str, f)
end
local on_ft = function(ft, f)
  local ft_str = type(ft) == "string" and ft or table.concat(ft, ",")
  misc.safely("filetype:" .. ft_str, f)
end

vim.g.tiny_cmdline = {
  width = { value = "70%" },
}
vim.pack.add({ "https://github.com/rachartier/tiny-cmdline.nvim" })
vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
})

require("plugins.colorschemes")
require("plugins.oil")
require("plugins.persistence")
require("plugins.smart_split")
require("plugins.snacks")
require("plugins.rocks")
require("plugins.vimtex")
require("plugins.treesitter")
require("plugins.fff")

later(function()
  require("plugins.ui")
  require("plugins.fyler")
  require("plugins.jump")
  -- require("plugins.lualine")
  require("plugins.markview")
  require("plugins.obsidian")
  require("plugins.project")
  require("plugins.whichkey")

  vim.pack.add({ "https://github.com/richwomanbtc/overleaf.nvim" })
  require("overleaf").setup({
    cookie = "s%3A1mGkt0ddiALr1ONXn8PwGy4xojebWJCk.b2M4oWNWEcNLK7IPXvTYKtWQg8duvyJrgkEJRoGm25M",
  })
end)

on_event("BufReadPre", function()
  require("plugins.filetype")
  require("plugins.lsp")
  require("plugins.trouble")
end)

on_event("BufRead", function()
  require("plugins.conform")
  require("plugins.editing")
  require("plugins.opencode")
  require("plugins.matchup")
  require("plugins.textcase")
  require("plugins.statuscol")
  vim.pack.add({ "https://github.com/saghen/blink.indent" })
  require("blink.indent").setup()
  require("plugins.blink_pairs")
end)

on_event({ "InsertEnter", "CmdlineEnter" }, function()
  require("plugins.blink")
  -- require("plugins.ultimatepair")
end)

on_event("InsertEnter", function()
  require("plugins.luasnip")
end)

on_ft({ "markdown", "quarto" }, function()
  require("plugins.quarto")
end)

on_ft("r", function()
  require("plugins.r")
end)

on_ft("typst", function()
  require("plugins.typst")
end)

-- require("plugins.fzf")
-- require("plugins.neorg")
-- require("plugins.noice")
-- require("plugins.yanky")
