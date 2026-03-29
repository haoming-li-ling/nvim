local M = {}

---@param str string
function M.replace_termcodes(str)
  return vim.api.nvim_replace_termcodes(str, true, false, true)
end

local function wk_to_lazy_helper(key_table, prefix)
  local lazy_table = {}
  for k, v in pairs(key_table) do
    if k == "name" then
      goto skip
    end
    if v[1] then
      local rhs, desc = unpack(v)
      -- local silence = v.silent or true
      local entry = {
        prefix .. k,
        rhs,
        desc = desc,
        silent = v.silent or true,
        mode = v.mode,
      }
      lazy_table[#lazy_table + 1] = entry
    else
      local sub_table = wk_to_lazy_helper(v, prefix .. k)
      for _, map in ipairs(sub_table) do
        lazy_table[#lazy_table + 1] = map
      end
    end
    ::skip::
  end
  return lazy_table
end

M.whichkey_to_lazy = function(key_table)
  return wk_to_lazy_helper(key_table, "")
end

M.meth_f = function(object, method)
  return function(...)
    return object[method](object, ...)
  end
end

return M
