-- local gen_spec = require("mini.ai").gen_spec
-- require("fun")()
-- local map = require("fun").map
-- local totable = require("fun").totable

local ai = require("mini.ai")
local ts = ai.gen_spec.treesitter
-- local spec_pair = ai.gen_spec.pair
-- local gen_spec = ai.gen_spec
-- local function adjust_sel(sel)
--   local lines = vim.api.nvim_buf_get_text(0, sel.from.line - 1, sel.from.col - 1, sel.from.line, 0, {})
--   local _, _, eq_seq = lines[1]:find("^%[(=*)")
--   if eq_seq then
--     return {
--       from = { line = sel.from.line, col = sel.from.col + 2 + #eq_seq },
--       to = { line = sel.to.line, col = sel.to.col - 2 - #eq_seq },
--     }
--   else
--     return {
--       from = { line = sel.from.line, col = sel.from.col + 1 },
--       to = { line = sel.to.line, col = sel.to.col - 1 },
--     }
--   end
-- end

vim.b.miniai_config = {
  custom_textobjects = {
    a = ts({ a = "@parameter.outer", i = "@parameter.inner" }),
    y = ts({ a = "@call.outer", i = "@call.inner" }),
    f = ts({ a = "@function.outer", i = "@function.inner" }),
    O = ts({ a = "@class.outer", i = "@class.inner" }),
    o = ts({ a = "@block.outer", i = "@block.inner" }),
    z = ts({ a = "@statement.outer", i = "@statement.outer" }),
    ["1"] = ts({ a = "@field.outer", i = "@field.outer" }),
    q = function(mode)
      local sels = ts({
        a = "@string.outer",
        i = "@string.outer",
      })("a")
      if mode == "a" then
        return sels
      else
        -- return totable(map(adjust_sel, sels))
        local results = {}
        for _, sel in ipairs(sels) do
          local lines = vim.api.nvim_buf_get_text(0, sel.from.line - 1, sel.from.col - 1, sel.from.line, 0, {})
          local _, _, eq_seq = lines[1]:find("^%[(=*)")
          if eq_seq then
            results[#results + 1] = {
              from = { line = sel.from.line, col = sel.from.col + 2 + #eq_seq },
              to = { line = sel.to.line, col = sel.to.col - 2 - #eq_seq },
            }
          else
            results[#results + 1] = {
              from = { line = sel.from.line, col = sel.from.col + 1 },
              to = { line = sel.to.line, col = sel.to.col - 1 },
            }
          end
        end
        return results
      end
    end,
  },
}
