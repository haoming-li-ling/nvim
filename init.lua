vim.loader.enable()
require("basic_options")
require("environment_variables")
require("basic_keymap")
require("autocommands")
require("plugins")

vim.opt.statusline = "%{%v:lua.require'statusline'.render()%}"
require("current_theme")
vim.cmd([[packadd nvim.undotree]])

local disabled_plugins = {
  "tohtml",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit",
}

for _, plugin in ipairs(disabled_plugins) do
  vim.g["loaded_" .. plugin] = 1
end
