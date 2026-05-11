local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local general_filetype = augroup("general_filetype", { clear = true })

autocmd("FileType", {
  group = general_filetype,
  pattern = "conf",
  callback = function()
    vim.bo.commentstring = "# %s"
  end,
})

autocmd("FileType", {
  group = general_filetype,
  pattern = "org",
  callback = function()
    vim.bo.textwidth = 0
  end,
})

autocmd("FileType", {
  group = general_filetype,
  pattern = { "help", "startuptime", "qf", "lspinfo", "tsplayground" },
  command = [[nnoremap <buffer><silent> q :close<CR>]],
})

-- autocmd("Filetype", {
-- 	group = general_filetype,
-- 	pattern = { "query" },
-- 	callback = function(args)
-- 		local bt = vim.api.nvim_get_option_value("buftype", { buf = args.buf })
-- 		if bt == "nofile" then
-- 			vim.keymap.set("n", "<leader>sp", "<cmd>close<cr>", { buffer = true })
-- 		end
-- 	end,
-- })

autocmd("FileType", {
  group = general_filetype,
  pattern = "man",
  command = [[nnoremap <buffer><silent> q :quit<CR>]],
})

-- autocmd("BufEnter", {
-- 	command = "syntax sync fromstart",
-- 	pattern = { "*.ly", "*.ily", "*.tex" },
-- })

autocmd({ "BufRead", "BufNewFile" }, {
  group = general_filetype,
  pattern = "vifmrc",
  command = [[set ft=vim]],
})

autocmd({ "BufReadPost", "BufNewFile" }, {
  group = general_filetype,
  pattern = "yabairc",
  command = [[set ft=bash]],
})

autocmd("FileType", {
  group = general_filetype,
  pattern = { "lazy", "lspinfo" },
  callback = function()
    vim.b.miniindentscope_disable = true
  end,
})

autocmd("FileType", {
  group = general_filetype,
  pattern = "nvim-undotree",
  callback = function()
    vim.keymap.set("n", "q", function()
      require("undotree").open()
    end)
  end,
})

-- local post_processing = augroup("post_processing", { clear = true })
-- autocmd({ "BufWritePost" }, {
--   group = post_processing,
--   pattern = "phone_book.json5",
--   command = [[!json5 -s 2 %:p -o %:p:h/phone_book.json]],
-- })

local post_processing = augroup("post_processing", { clear = true })
autocmd({ "BufWritePost" }, {
  group = post_processing,
  pattern = "phone_book.yaml",
  command = [[!yq -o=json eval %:p > phone_book.json]],
})

local tex_scratch = augroup("tex_scratch", { clear = true })
autocmd("BufUnload", {
  group = tex_scratch,
  pattern = "tex_scratch*",
  command = [[normal ggVG"+y]],
})

local yank = augroup("yank", { clear = true })
autocmd("TextYankPost", {
  group = "yank",
  callback = function()
    vim.hl.on_yank({ higroup = "IncSearch", timeout = 300 })
  end,
})

-- vim.api.nvim_create_autocmd("BufWritePost", {
-- 	pattern = "/Users/haomingli/Documents/Measurements/modernGraphTool/dist/data/phone_book.json",
-- 	callback = function(args)
-- 		local filepath = vim.fn.expand(args.file)
-- 		local copy_path = "/Users/haomingli/Documents/Measurements/modernGraphTool/dist/data/phones/phone_book.json" -- e.g., writes to file.txt.copy
-- 		vim.fn.writefile(vim.fn.readfile(filepath), copy_path)
-- 	end,
-- })

autocmd("BufWritePost", {
  pattern = "/Users/haomingli/.config/kitty/kitty.conf",
  callback = function()
    local stdout = vim.system({ "pgrep", "-a", "kitty" }, { text = true }):wait().stdout
    if not stdout then
      return
    end
    local kitty_pid = stdout:gsub("\n", "")
    vim.system({ "kill", "-SIGUSR1", kitty_pid }, { text = true }):wait()
  end,
})

-- local g = vim.api.nvim_create_augroup("format_on_save", { clear = true })
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   group = g,
--   pattern = "*.fish",
--   callback = function()
--     vim.cmd("normal! gg=G")
--   end,
-- })

local fish = vim.api.nvim_create_augroup("fish", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = fish,
  pattern = "fish",
  callback = function()
    -- vim.bo.equalprg = "fish_indent"
    vim.bo.expandtab = true
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
  end,
})
