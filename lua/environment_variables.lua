-- if not vim.env.NVIM_APPNAME then
--   vim.env.NVIM_APPNAME = "nvim"
-- end
vim.env.MYINITVIM = vim.fn.stdpath("config") .. "/init.lua"
vim.env.MYINITLUA = vim.fn.stdpath("config") .. "/init.lua"
vim.env.MYCONFIGS = vim.fn.stdpath("config") .. "/lua/plugins"
vim.env.MYKEYMAP = vim.fn.stdpath("config") .. "/lua/basic_keymap.lua"
vim.env.MYOPTIONS = vim.fn.stdpath("config") .. "/lua/basic_options.lua"
vim.env.AUTOCMDS = vim.fn.stdpath("config") .. "/lua/autocommands.lua"
vim.env.MYLSPMAP = vim.fn.stdpath("config") .. "/lua/hl/lsp/util.lua"
vim.env.DISPLAY = ":0"
-- vim.env.DBUS_SESSION_BUS_ADDRESS = 'unix:path=' .. vim.env.DBUS_LAUNCHD_SESSION_BUS_SOCKET
if not vim.env.PATH:find("/opt/homebrew/bin") then
  vim.env.PATH = "/opt/homebrew/bin:" .. vim.env.PATH
end

if not vim.env.PATH:find("/usr/local/bin") then
  vim.env.PATH = "/usr/local/bin:" .. vim.env.PATH
end

-- vim.env.SNACKS_WEZTERM = true
