vim.env.MYINITVIM = "~/.config/nvim/init.lua"
vim.env.MYINITLUA = "~/.config/nvim/init.lua"
vim.env.MYCONFIGS = "~/.config/nvim/lua/plugins"
vim.env.MYKEYMAP = "~/.config/nvim/lua/basic_keymap.lua"
vim.env.MYOPTIONS = "~/.config/nvim/lua/basic_options.lua"
vim.env.AUTOCMDS = "~/.config/nvim/lua/autocommands.lua"
vim.env.MYLSPMAP = "~/.config/nvim/lua/hl/lsp/util.lua"
vim.env.DISPLAY = ":0"
-- vim.env.DBUS_SESSION_BUS_ADDRESS = 'unix:path=' .. vim.env.DBUS_LAUNCHD_SESSION_BUS_SOCKET
if not vim.env.PATH:find("/opt/homebrew/bin") then
  vim.env.PATH = "/opt/homebrew/bin:" .. vim.env.PATH
end

if not vim.env.PATH:find("/usr/local/bin") then
  vim.env.PATH = "/usr/local/bin:" .. vim.env.PATH
end

-- vim.env.SNACKS_WEZTERM = true
