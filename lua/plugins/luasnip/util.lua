---@diagnostic disable: undefined-doc-name
-- local ts_utils = require("nvim-treesitter.ts_utils")
local ls = require("luasnip")
local snippet = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmta = require("luasnip.extras.fmt").fmta
local m = require("luasnip.extras").m
local l = require("luasnip.extras").l
local postfix = require("luasnip.extras.postfix").postfix
local ne = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda

local M = {}

M.angle_brack = { delimiters = "<>" }

---Make a simpler toggling function node
---@param s string
---@param index number
---@return function_node
function M.tg(s, index)
  return ne(index, s, "")
end

---Make a copying (optionally transforming) dynamic insert node
---@param index number
---@param x number
---@param fun? function
---@param y? number
---@return dynamic_node
function M.cp(index, x, fun, y)
  x = x or 1
  y = y or 1
  fun = fun or function(a)
    return a
  end
  return d(index, function(args)
    return sn(nil, i(1, fun(args[x][y])))
  end, x)
end

---Surround string with affixes
---@param prefix string
---@param suffix string
---@return function
function M.su(prefix, suffix)
  prefix = prefix or ""
  suffix = suffix or ""
  ---@param s string
  ---@return string
  return function(s)
    return prefix .. s .. suffix
  end
end

---Compose two string functions
---@param fun1 function
---@param fun2 function
---@return function
function M.o(fun1, fun2)
  ---@param s string
  return function(s)
    return fun1(fun2(s))
  end
end

---Make dynamic node that is visual or specified text or "text"
---@param index number
---@param text string?
---@param line number?
---@return dynamic_node
function M.vi(index, text, line)
  -- index = index or 1
  local ind = index
  if index == 0 then
    ind = 1
  end
  return d(index, function(_, snip)
    return sn(nil, i(1, snip.env.TM_SELECTED_TEXT[line or ind] or text or ""))
  end)
end

---Make dynamic node that is visual or specified text or "text"
---@param index number
---@param text string?
---@param line number?
---@return dynamic_node
function M.ci(index, text, line)
  -- index = index or 1
  local ind = index
  if index == 0 then
    ind = 1
  end
  return d(index, function()
    return sn(nil, i(1, vim.fn.getreg('"', 1, true)[line or ind] or text or ""))
  end)
end

---Make dynamic node that is visual or specified text or "text"
---@param index number
---@param text string?
---@return dynamic_node
function M.vic(index, text)
  -- index = index or 1
  -- local ind = index
  -- if index == 0 then
  -- 	ind = 1
  -- end
  return d(index, function(_, snip)
    local selected = table.concat(snip.env.TM_SELECTED_TEXT, "\n")
    return sn(nil, i(1, selected or text or ""))
  end)
end

---Generate recursive snippet node for lists
---@param bullet string
---@param node function
---@return function
local function rec_gen(bullet, node)
  ---@return snippet_node
  local function temp()
    return sn(nil, {
      c(1, {
        t(""),
        sn(nil, {
          t({ "", bullet }),
          node(),
          d(2, temp) }) }) })
  end
  return temp
end

local function ng_node()
  return sn(1, {
    i(1, "word"),
    t("["),
    i(2, "gloss"),
    t("]") })
end

---Make ngloss indent snippet node
---@param index number
---@param indent string
---@return indent_snippet_node
function M.gln(index, indent)
  return isn(
    index,
    fmta(
      [[
  \begingl[glstyle=nlevel]
    <>[<>]<>
    \glft `<>'
  \endgl]],
      {
        i(1, "word"),
        i(2, "gloss"),
        d(3, rec_gen("  ", ng_node)),
        i(4, "translation") }
    ),
    indent
  )
end

---@type function
M.rec_ls = rec_gen("  \\item ", function()
  return i(1)
end)

---@type function
M.rec_ex = rec_gen("  \\a ", function()
  return i(1)
end)

---@type function
M.rec_gln = rec_gen("  ", ng_node)

---@type function
M.rec_exn = rec_gen("  \\a ", function()
  return M.gln(1, "$PARENT_INDENT  ")
end)

---Make snippet node for a table row
---@param args any
---@return snippet_node
function M.table_node(args)
  local tabs = {}
  local cells = args[1][1]:gsub("%s", ""):gsub("|", "")
  local count = #cells
  for j = 1, count do
    tabs[2 * j - 1] = i(j)
    if j ~= count then
      tabs[2 * j] = t(" & ")
    end
  end
  return sn(nil, tabs)
end

function M.tableau(first, rest)
  return function(args)
    local tabs = { t(string.format([[\%s{]], first)), i(1), t([[}]]), t(" ") }
    local cells = args[1][1]:gsub("%s", ""):gsub("[|:]", "")
    local count = #cells
    for j = 1, count do
      tabs[2 * j + 3] = sn(j + 1, fmta(string.format([[\%s{<>}]], rest), i(1)))
      if j ~= count then
        tabs[2 * j + 4] = t(" ")
      end
    end
    return sn(nil, tabs)
  end
end

M.tableau_constraints = M.tableau("ip", "c")
M.tableau_candidates = M.tableau("ca", "v")
M.tableau_optimal = M.tableau("cp", "v")

---Generate recursive snippet node for tables
---@param index number
---@param indent string
---@return function
local function rec_table_gen(index, indent)
  local function temp()
    return sn(nil, {
      c(1, {
        t(""),
        sn(nil, {
          t({ "\\\\", indent }),
          d(1, M.table_node, ai[index]),
          d(2, temp) }) }) })
  end
  return temp
end

---@type function
M.rec_table = rec_table_gen(1, "")

---@type function
M.rec_table_full = rec_table_gen(4, "  ")

---Make function node for the leading whitespace of regTrig
---@return function_node
function M.leading_white()
  return f(function(_, snip)
    return snip.snippet.captures[1]
  end)
end

local function tex_math(line_to_cursor, matched_trigger, captures)
  return vim.api.nvim_eval("vimtex#syntax#in_mathzone()") == 1
end
local function tex_text(line_to_cursor, matched_trigger, captures)
  return not tex_math(line_to_cursor, matched_trigger, captures)
end
-- local function tex_math(_, _, _)
--   local node = ts_utils.get_node_at_cursor(0)
--   local root
--   if node then root = ts_utils.get_root_for_node(node) end
--   if not root then return false end
--   local parent
--   if node then parent = node:parent() end
--   while node ~= nil and node ~= root do
--     local node_type = node:type()
--     if node_type == "label_definition" or node_type == "text_mode" then
--       return false
--     elseif
--       node_type == "inline_formula"
--       or node_type == "displayed_equation"
--       or node_type == "math_environment"
--     then
--       return true
--     elseif node_type == "ERROR" then
--       local tab = vim.treesitter.get_node_text(node, 0)
--       if type(tab) == "string" then tab = { tab } end
--       for _, text in ipairs(tab) do
--         if
--           string.find(text, "%$")
--           or string.find(text, "\\%[")
--           or string.find(text, "\\%(")
--         then
--           return true
--         end
--       end
--     end
--     node = parent
--     if node then parent = node:parent() end
--   end
--   return false
-- end
-- function M.tex_math_mode()
-- 	local node = ts_utils.get_node_at_cursor(0)
-- 	local root
-- 	if node then
-- 		root = ts_utils.get_root_for_node(node)
-- 	end
-- 	if not root then
-- 		return false
-- 	end
-- 	local parent
-- 	if node then
-- 		parent = node:parent()
-- 	end
-- 	while node ~= nil and node ~= root do
-- 		local t = node:type()
-- 		if t == "label_definition" or t == "text_mode" then
-- 			return false
-- 		elseif t == "inline_formula" or t == "displayed_equation" or t == "math_environment" then
-- 			return true
-- 		elseif t == "ERROR" then
-- 			local tab = vim.treesitter.get_node_text(node, 0)
-- 			if type(tab) == "string" then
-- 				tab = { tab }
-- 			end
-- 			for _, text in ipairs(tab) do
-- 				if string.find(text, "%$") or string.find(text, "\\%[") then
-- 					return true
-- 				end
-- 			end
-- 		end
-- 		node = parent
-- 		if node then
-- 			parent = node:parent()
-- 		end
-- 	end
-- 	return false
-- end

-- function M.markdown_math_mode()
-- 	if M.tex_math_mode() then
-- 		return true
-- 	end
-- 	local node = ts_utils.get_node_at_cursor(0)
-- 	local parent
-- 	if node then
-- 		parent = node:parent()
-- 	end
-- 	while node ~= nil do
-- 		local t = node:type()
-- 		if t == "inline" then
-- 			local start_row, _, end_row, _ = vim.treesitter.get_node_range(node)
-- 			local tab = vim.api.nvim_buf_get_lines(0, start_row, end_row + 1, false)
-- 			local row, col = unpack(vim.api.nvim_win_get_cursor(0))
-- 			local inside = false
-- 			for i, text in ipairs(tab) do
-- 				if i > row - start_row then
-- 					break
-- 				end
-- 				local index = 0
-- 				local flag = false
-- 				repeat
-- 					_, index = string.find(text, "%$%$", index)
-- 					if index then
-- 						if i == row - start_row then
-- 							if index > col + 1 then
-- 								flag = true
-- 							else
-- 								inside = not inside
-- 							end
-- 						else
-- 							inside = not inside
-- 						end
-- 					else
-- 						flag = true
-- 					end
-- 				until flag == true
-- 			end
-- 			return inside
-- 		end
-- 		node = parent
-- 		if node then
-- 			parent = node:parent()
-- 		end
-- 	end
-- 	return false
-- end

-- function M.markdown_text_mode()
-- 	return not M.markdown_math_mode()
-- end

-- local has_treesitter, ts = pcall(require, "vim.treesitter")
-- local _, query = pcall(require, "vim.treesitter.query")

-- local MATH_NODES = {
-- 	displayed_equation = true,
-- 	inline_formula = true,
-- 	math_environment = true,
-- }

-- local COMMENT = {
-- 	["comment"] = true,
-- 	["line_comment"] = true,
-- 	["block_comment"] = true,
-- 	["comment_environment"] = true,
-- }

-- local function get_node_at_cursor()
-- 	local buf = vim.api.nvim_get_current_buf()
-- 	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
-- 	row = row - 1
-- 	col = col - 1
--
-- 	-- local parser = ts.get_parser(buf, "latex")
-- 	local ok, parser = pcall(ts.get_parser, buf, "latex")
-- 	if not ok or not parser then
-- 		return
-- 	end
-- 	-- if not parser then
-- 	-- 	return
-- 	-- end
--
-- 	local root_tree = parser:parse()[1]
-- 	local root = root_tree and root_tree:root()
--
-- 	if not root then
-- 		return
-- 	end
--
-- 	return root:named_descendant_for_range(row, col, row, col)
-- end

-- function M.in_comment()
-- 	if has_treesitter then
-- 		local node = get_node_at_cursor()
-- 		while node do
-- 			if COMMENT[node:type()] then
-- 				return true
-- 			end
-- 			node = node:parent()
-- 		end
-- 		return false
-- 	end
-- end

-- function M.in_mathzone()
-- 	if has_treesitter then
-- 		local node = get_node_at_cursor()
-- 		while node do
-- 			if node:type() == "text_mode" then
-- 				return false
-- 			elseif MATH_NODES[node:type()] then
-- 				return true
-- 			end
-- 			node = node:parent()
-- 		end
-- 		return false
-- 	end
-- end

-- local MATH_ENVIRONMENTS = {
--   displaymath = true,
--   equation = true,
--   eqnarray = true,
--   align = true,
--   math = true,
--   array = true,
-- }
-- local MATH_NODES = {
--   displayed_equation = true,
--   inline_formula = true,
-- }

-- local function get_node_at_cursor()
--   local cursor = vim.api.nvim_win_get_cursor(0)
--   local cursor_range = { cursor[1] - 1, cursor[2] }
--   local buf = vim.api.nvim_get_current_buf()
--   local ok, parser = pcall(ts.get_parser, buf, "latex")
--   if not ok or not parser then
--     return
--   end
--   local root_tree = parser:parse()[1]
--   local root = root_tree and root_tree:root()
--
--   if not root then
--     return
--   end
--
--   return root:named_descendant_for_range(
--     cursor_range[1],
--     cursor_range[2],
--     cursor_range[1],
--     cursor_range[2]
--   )
-- end

-- function M.in_comment()
--   if has_treesitter then
--     local node = get_node_at_cursor()
--     while node do
--       if node:type() == "comment" then
--         return true
--       end
--       node = node:parent()
--     end
--     return false
--   end
-- end

-- https://github.com/nvim-treesitter/nvim-treesitter/issues/1184#issuecomment-830388856
-- function M.in_mathzone()
--   if has_treesitter then
--     local buf = vim.api.nvim_get_current_buf()
--     local node = get_node_at_cursor()
--     while node do
--       if MATH_NODES[node:type()] then
--         return true
--       elseif node:type() == "math_environment" or node:type() == "generic_environment" then
--         local begin = node:child(0)
--         local names = begin and begin:field "name"
--         if
--           names
--           and names[1]
--           and MATH_ENVIRONMENTS[query.get_node_text(names[1], buf):match "[A-Za-z]+"]
--         then
--           return true
--         end
--       end
--       node = node:parent()
--     end
--     return false
--   end
-- end

-- function M.in_textzone()
-- 	return not M.in_mathzone() and not M.in_comment()
-- end

M.text_mode = { condition = tex_text, show_condition = tex_text }
M.math_mode = { condition = tex_math, show_condition = tex_math }

-- M.text_mode =
--   { condition = M.markdown_text_mode, show_condition = M.markdown_text_mode }
-- M.math_mode =
--   { condition = M.markdown_math_mode, show_condition = M.markdown_math_mode }

-- M.text_mode = { condition = M.in_textzone, show_condition = M.in_textzone }
-- M.math_mode = { condition = M.in_mathzone, show_condition = M.in_mathzone }

return M
