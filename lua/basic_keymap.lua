local map = vim.keymap.set
map("n", "j", "(v:count == 0 ? 'gj' : 'j')", { expr = true, silent = true })
map("n", "k", "(v:count == 0 ? 'gk' : 'k')", { expr = true, silent = true })

map("n", "gj", "j", { silent = true })
map("n", "gk", "k", { silent = true })

map({ "n", "x" }, "<localleader>p", [["+p]], { remap = true })
map({ "n", "x" }, "<localleader>P", [["+P]], { remap = true })
map({ "n", "x" }, "<localleader>y", [["+y]], { remap = true })
map({ "n", "x" }, "<localleader>Y", [["+Y]], { remap = true })

map("x", "j", 'mode() ==# "v" ? "gj" : "j"', { expr = true, silent = true })
map("x", "k", 'mode() ==# "v" ? "gk" : "k"', { expr = true, silent = true })
map("x", "gj", 'mode() ==# "v" ? "j" : "gj"', { expr = true, silent = true })
map("x", "gk", 'mode() ==# "v" ? "k" : "gk"', { expr = true, silent = true })
map("n", "J", "mzJ`z")

map("s", "<bs>", "<c-g>s")

map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit", silent = true })
map("n", "<leader>qK", "<cmd>q!<cr>", { desc = "Force quit", silent = true })
map("n", "<leader>qw", "<cmd>wq<cr>", { desc = "Save and quit", silent = true })
map("n", "<leader>qk", "<cmd>wq<cr>", { desc = "Save and quit", silent = true })
map("n", "<leader>qrr", "<cmd>restart<cr>", { desc = "Restart neovim", silent = true })

map("n", "<leader>fs", "<cmd>w<cr>", { desc = "Save", silent = true })
map("n", "<leader>fx", "<cmd>e<cr>", { desc = "Reread file", silent = true })
map("n", "<leader>fp", "<cmd>e $MYINITVIM<cr>", { desc = "Edit main config", silent = true })
map("n", "<leader>fk", "<cmd>e $MYKEYMAP<cr>", { desc = "Edit keymap", silent = true })
map("n", "<leader>fo", "<cmd>e $MYOPTIONS<cr>", { desc = "Edit options", silent = true })
map("n", "<leader>fa", "<cmd>e $AUTOCMDS<cr>", { desc = "Edit autocommands", silent = true })
map("n", "<leader>fc", "<cmd>cd %:p:h<cr>", { desc = "CWD to current file", silent = true })
map("n", "<leader>L", "<cmd>lua vim.pack.update()<cr>", { desc = "Update plugins" })

-- map("n", "<leader>hrr", "<cmd>luafile $MYINITVIM<cr>", { desc = "Reload main config", silent = true })

map("n", "<leader>w", "<c-w>", { desc = "+window", remap = true })
map("n", "<c-h>", "<c-w>h")
map("n", "<c-j>", "<c-w>j")
map("n", "<c-k>", "<c-w>k")
map("n", "<c-l>", "<c-w>l")

-- vim.keymap.set("i", "jk", "<esc>")
-- vim.keymap.set("t", "jk", "<c-\\><c-n>")
map("t", "<esc>", "<c-\\><c-n>")

-- map("n", "<leader>bk", "<cmd>bd<cr>", { desc = "Delete buffer", silent = true })
-- map("n", "<leader>bK", "<cmd>bd!<cr>", { desc = "Force delete buffer", silent = true })

map("n", "<leader>hs", "<cmd>Inspect<cr>", { desc = "Inspect" })
map("n", "<leader>h:", "q:", { desc = "Edit command line" })
map("n", "g:", "q:", { desc = "Edit command line" })
-- vim.keymap.set("i", "<d-v>", '<c-o>"+p')
-- map("i", "<D-s>", '<esc>l"+Pli')
map("i", "<D-v>", "<C-r>+")
-- map("i", "<D-v>", "<esc>")
map("c", "<D-v>", "<C-r>+")
map("n", "<D-v>", '"+p')
map("x", "<D-c>", '"+y')
map("x", "<D-x>", '"+d')

-- map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })

map("i", "<c-;>", "'<c-g>u<Esc>[s1z=`]a<c-g>u'", { expr = true })
-- vim.keymap.set("i", "<c-bs>", "'<c-w>'", { expr = true })
-- map("n", "<leader>sp", "<cmd>InspectTree<cr>", { desc = "Show TS node" })

map("n", "<leader>sp", function()
  local bt = vim.api.nvim_get_option_value("buftype", { buf = 0 })
  local ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
  if bt == "nofile" and ft == "query" then
    vim.cmd("close")
  else
    vim.cmd("InspectTree")
  end
end, { desc = "Toggle TS tree" })

map("n", "<leader>st", "<cmd>Inspect<cr>", { desc = "Show highlights" })
-- map("v", "<", "<gv")
-- map("v", ">", ">gv")
map("n", "[b", "<cmd>bp<cr>")
map("n", "]b", "<cmd>bn<cr>")
map(
  "n",
  "<leader>rth",
  [[,p<cmd>%s/"},{"url":"/\r/g | %s/"}],"threadCount":5}//g<cr>ggVG,y<leader>bK<leader>qq]],
  { desc = "Format Thunder links", remap = true }
)
map({ "x", "o" }, "aF", "Va1", { remap = true })
map({ "n", "x", "o" }, "<C-n>", function()
  if vim.treesitter.get_parser(nil, nil, { error = false }) then
    require("vim.treesitter._select").select_parent(vim.v.count1)
  else
    vim.lsp.buf.selection_range(vim.v.count1)
  end
end, { desc = "Select parent (outer) node" })
map({ "n", "x", "o" }, "<C-p>", function()
  if vim.treesitter.get_parser(nil, nil, { error = false }) then
    require("vim.treesitter._select").select_child(vim.v.count1)
  else
    vim.lsp.buf.selection_range(-vim.v.count1)
  end
end, { desc = "Select child (inner) node" })

map({ "n" }, "<leader>U", function()
  require("undotree").open()
end)
-- vim.api.nvim_create_user_command("Thunder", function()
-- 	vim.cmd(
-- 		[[normal! <cmd>e scratch<cr>,p<cmd>%s/"},{"url":"/\r/g | %s/"}],"threadCount":5}//g<cr>ggVG,y<leader>bK<leader>qq]]
-- 	)
-- end, {})
--
Keymap_replace = [[%s/vim.keymap.set(\(".\{-}"\), \(".\{-}"\), \(function\_.\{-}end\))/{ \2, \3, mode = { \1 } },/g]]
