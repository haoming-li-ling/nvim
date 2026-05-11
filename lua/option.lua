---@class Option<T>
---@field obj? T
local M = {}

---@generic T
---@param obj T
---@return Option<T>
function M.some(obj)
  local new_option = vim.deepcopy(M)
  new_option.obj = obj
  return new_option
end

---@generic T, R
---@param self Option<T>
---@param f fun(obj: T): Option<R>
---@return Option<T>|Option<R>
function M.bind(self, f)
  if not self.obj then
    return self
  else
    return f(self.obj)
  end
end

---@generic T, R
---@param self Option<T>
---@param f fun(obj: T): R
---@return Option<T>|Option<R>
function M.fmap(self, f)
  if not self.obj then
    return self
  else
    return M.some(f(self.obj))
  end
end

return M
