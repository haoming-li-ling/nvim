vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.o.termguicolors = true

vim.o.smartindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.autoindent = true
vim.o.cindent = true
vim.o.exrc = true
-- nvim/init.lua

vim.o.conceallevel = 2
vim.o.smarttab = true
vim.o.tabstop = 2
vim.o.softtabstop = 4
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.foldlevel = 99

vim.o.winborder = "rounded"
-- vim.o.scrolloff = 8
vim.o.inccommand = "nosplit"
vim.o.redrawtime = 1000
-- vim.o.lazyredraw = true

-- vim.o.laststatus = 3
-- vim.o.colorcolumn = { "80" }
vim.o.mouse = "a"
vim.o.wrap = true
vim.o.linebreak = true
vim.o.breakindent = true
-- vim.o.showbreak = "+++"
-- vim.o.showbreak = "↪ "
-- vim.opt.linespace = -1
vim.opt.backspace = { "indent", "eol", "start" }
-- vim.o.linespace = 5
vim.o.number = true
vim.o.relativenumber = false
vim.o.signcolumn = "yes"
vim.o.showmode = false
vim.o.textwidth = 0
-- vim.o.clipboard = "unnamedplus"
vim.o.spell = false
vim.o.timeoutlen = 500
vim.o.swapfile = false
-- vim.o.concealcursor = "n"
vim.o.cmdheight = 0
-- vim.o.listchars = { "eol:¬", "tab:>", "trail:~", "extends:>", "precedes:<", "space:␣" }
-- vim.o.list = true

vim.o.shell = "/opt/homebrew/bin/fish"
-- vim.o.shell = "/opt/homebrew/bin/zsh"
-- vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")
vim.diagnostic.config({
  virtual_text = false,
})

--@Neovide
if vim.g.neovide then
  vim.g.neovide_input_use_logo = true
  -- vim.g.neovide_input_macos_alt_is_meta = true
  vim.g.neovide_input_macos_option_key_is_meta = "only_left"
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_cursor_animation_length = 0.02
  vim.g.neovide_cursor_trail_length = 0.1
  -- vim.g.neovide_transparency = 0.8
  -- vim.o.guifont = "mononoki Nerd Font Mono:h15"
  -- vim.o.guifont = "CaskaydiaCove Nerd Font:h14"
  -- vim.o.guifont = "Iosevka Nerd Font Mono:h15"
  -- vim.o.guifont = "mononoki Nerd Font Mono:h15"
  -- vim.o.guifont = "JetBrains Mono,Symbols Nerd Font,Liberation Mono:h14"
  -- vim.o.guifont =
  --   "JetBrainsMono Nerd Font Mono,Symbols Nerd Font,Liberation Mono:h14"
  -- vim.o.guifont = "JetBrains Mono,Liberation Mono:h14"
  -- vim.o.guifont = "Menlo:h14"
  -- vim.o.guifont = "Liberation Mono:h14"
  -- vim.g.neovide_transparency = 0.8
  -- vim.g.transparency = 0.8
  -- vim.g.neovide_window_blurred = true
end

-- vim.g.barbaric_default = 0
vim.g.fzf_prefix = "<leader>`"
vim.g.snack_prefix = "<leader>"
vim.g.telescope_prefix = "<leader>\\"
-- vim.treesitter.language.register("bash", "zsh")

local function setpairs(match, _, source, predicate, metadata)
  -- (#set-pairs! @aa key list)
  local capture_id = predicate[2]
  if not match[capture_id] then
    return
  end
  if not match[capture_id][1] then
    return
  end
  local node = match[capture_id][1]
  local key = predicate[3]
  if not node then
    return
  end
  if not node.range then
    return
  end
  -- local node_text = vim.treesitter.get_node_text(node, source)
  local node_text = vim.treesitter.get_node_text(node, source)
  -- if metadata[capture_id] and metadata[capture_id].range then
  --   local sr, sc, er, ec = unpack(metadata[capture_id].range)
  --   node_text = vim.api.nvim_buf_get_text(source, sr, sc, er, ec, {})[1]
  -- end
  for i = 4, #predicate, 2 do
    if node_text == predicate[i] then
      if not metadata[capture_id] then
        metadata[capture_id] = {}
        metadata[capture_id][key] = predicate[i + 1]
      end
      break
    end
  end
end
vim.treesitter.query.add_directive("set-pairs!", setpairs, { force = true })
-- require("vim._core.ui2").enable({
--   enable = true, -- Whether to enable or disable the UI.
--   msg = { -- Options related to the message module.
--     ---@type 'cmd'|'msg' Where to place regular messages, either in the
--     ---cmdline or in a separate ephemeral message window.
--     target = "msg",
--     timeout = 4000, -- Time a message is visible in the message window.
--   },
-- })
vim.g.whichkey = true
vim.o.cmdheight = 0
vim.g.finder = "fff"
require("vim._core.ui2").enable({
  enable = true,
  msg = {
    targets = {
      [""] = "msg",
      empty = "cmd",
      bufwrite = "msg",
      confirm = "cmd",
      emsg = "pager",
      echo = "msg",
      echomsg = "msg",
      echoerr = "pager",
      completion = "cmd",
      list_cmd = "pager",
      lua_error = "pager",
      lua_print = "msg",
      progress = "pager",
      rpc_error = "pager",
      quickfix = "msg",
      search_cmd = "cmd",
      search_count = "cmd",
      shell_cmd = "pager",
      shell_err = "pager",
      shell_out = "pager",
      shell_ret = "msg",
      undo = "msg",
      verbose = "pager",
      wildlist = "cmd",
      wmsg = "msg",
      typed_cmd = "cmd",
    },
    cmd = {
      height = 0.5,
    },
    dialog = {
      height = 0.5,
    },
    msg = {
      height = 0.3,
      timeout = 5000,
    },
    pager = {
      height = 0.5,
    },
  },
})
