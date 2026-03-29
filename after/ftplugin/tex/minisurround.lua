local ts_input = require("mini.surround").gen_spec.input.treesitter
local user_input = require("mini.surround").user_input
vim.b.minisurround_config = {
  n_lines = 50,
  custom_surroundings = {
    b = { input = { [[\textbf{().-()}]] }, output = { left = [[\textbf{]], right = [[}]] } },
    i = { input = { [[\emph{().-()}]] }, output = { left = [[\emph{]], right = [[}]] } },
    c = { input = { [[\textsc{().-()}]] }, output = { left = [[\textsc{]], right = [[}]] } },
    I = { input = { [[\emph{().-()}]] }, output = { left = [[\textit{]], right = [[}]] } },
    u = { input = { [[\ul{().-()}]] }, output = { left = [[\ul{]], right = [[}]] } },
    U = { input = { [[\underline{().-()}]] }, output = { left = [[\underline{]], right = [[}]] } },
    q = { input = { "`().-()'" }, output = { left = "`", right = "'" } },
    ["$"] = { input = [[\(().-()\)]], output = { left = [[\(]], right = [[\)]] } },
    y = {
      -- input = ts_input({ outer = "@statement.outer", inner = "@statement.inner" }),
      input = ts_input({ outer = "@call.outer", inner = "@call.inner" }),
      output = function()
        local command = user_input("Command")
        return { left = ([[\%s{]]):format(command), right = [[}]] }
      end,
    },
    E = {
      input = ts_input({ outer = "@block.outer", inner = "@block.inner" }),
      output = function()
        local env = user_input("Environment")
        return { left = ([[\begin{%s}]]):format(env), right = ([[\end{%s}]]):format(env) }
      end,
    },
  },
}

-- vim.keymap.del("x", "ys")
-- vim.keymap.set("x", "S", [[:<C-u>lua MiniSurround.add('visual')<CR>]], { silent = true })
