local M = {}
function M.some(obj)
  local new_option = vim.deepcopy(M)
  new_option.obj = obj
  return new_option
end

function M.bind(self, f)
  if not self.obj then
    return self
  else
    return f(self.obj)
  end
end

function M.wind(self, f)
  if not self.obj then
    return self
  else
    return M.some(f(self.obj))
  end
end

return M
