local ai = require("mini.ai")
local gen_spec = ai.gen_spec
local spec_treesitter = ai.gen_spec.treesitter
local select_region = ai.select_textobject
-- local pattern_linewise = function(captures)
--   local ts_charwise = ai.gen_spec.treesitter(captures)
--   return function(...)
--     local regions = ts_charwise(...)
--     for _, r in ipairs(regions) do
--       -- NOTE: This can also be done more granularly, like only for `a`
--       -- textobject (check first argument of `...`).
--       r.vis_mode = "V"
--     end
--     return regions
--   end
-- end
vim.b.miniai_config = {
  custom_textobjects = {
    -- Y = spec_treesitter({
    --   a = "@statement.outer",
    --   i = "@statement.inner",
    -- }),
    -- Y = { {
    --   "\\().-()%b[]%b{}",
    --   "\\().-()%b{}",
    -- } },
    ["$"] = { [[\%(().-()\%)]] },
    q = { "`().-()'" },
    y = function(mode)
      if mode == "a" then
        return spec_treesitter({
          a = "@call.outer",
          i = "@call.inner",
        })("a")
        -- {
        --   {
        --     "()\\[^%[{%s\\]*[^%s\\]*%b{}%b{}%b{}%b{}%b{}%b{}()",
        --     "()\\[^%[{%s\\]*[^%s\\]*%b{}%b{}%b{}%b{}%b{}()",
        --     "()\\[^%[{%s\\]*[^%s\\]*%b{}%b{}%b{}%b{}()",
        --     "()\\[^%[{%s\\]*[^%s\\]*%b{}%b{}%b{}()",
        --     "()\\[^%[{%s\\]*[^%s\\]*%b{}%b{}()",
        --     "()\\[^%[{%s\\]*[^%s\\]*%b{}()",
        --   },
        -- }
      else
        -- return { {
        --   "\\().-()%b[]%b{}",
        --   "\\().-()%b{}",
        -- } }
        return {
          "\\()[^%[{%s\\]*()[^%s\\]*",
        }
      end
    end,
    E = spec_treesitter({
      a = "@block.outer",
      i = "@block.inner",
    }),
    L = {
      {
        "\\lambda ().-()%.\\, ",
        "\\exists ().-()%.\\, ",
        "\\forall ().-()%.\\, ",
        "\\iota ().-()%.\\, ",
      },
    },
    D = {
      {
        "%.().-()\\land",
        "%.().-()\\lor",
        "\\land().-()\\land",
        "\\lor().-()\\lor",
        "\\land().-()\\lor",
        "\\lor().-()\\land",
        "\\land().-()\\%)",
        "\\lor().-()\\%)",
      },
    },
    -- ["1"] = { "%.().-()\\land" },
    -- ["2"] = { "%.().-()\\lor" },
    -- ["3"] = { "\\land().-()\\land" },
    -- ["4"] = { "\\lor().-()\\lor" },
    -- ["5"] = { "\\land().-()\\lor" },
    -- ["6"] = { "\\lor().-()\\land" },
    -- ["7"] = { "\\land().-()\\)" },
    -- ["8"] = { "\\lor().-()\\)" },
    a = gen_spec.argument({ brackets = { "%b{}", "%b()", "%b[]" } }),
    -- x = { "\\ex%.().-()\n\n" },
    -- x = { "\\ex%.().-()\n\n" },
    ["5"] = { "\\ex%.().-()\n\n" },
    -- x = { "\\p?ex().-()\\xe" },
    g = { "\\begingl().-()\\endgl" },
    r = {
      {
        "{()itm:().-()()}",
        "{()sec:().-()()}",
        "{()sub:().-()()}",
        "{()ssub:().-()()}",
        "{()par:().-()()}",
        "{()fig:().-()()}",
        "{()tab:().-()()}",
        "{()ex:().-()()}",
      },
    },
  },
}
vim.keymap.set({ "o", "x" }, "ax", function()
  select_region("a", "5", { operator_pending = true, vis_mode = "V" })
end, { buffer = true })
