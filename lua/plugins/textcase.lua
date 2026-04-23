vim.pack.add({
  "https://github.com/johmsalas/text-case.nvim",
})

local keys = {}
local keymap = {
  u = { "to_upper_case", "To UPPERCASE" },
  l = { "to_lower_case", "To lowercase" },
  s = { "to_snake_case", "To snake_case" },
  d = { "to_dash_case", "To dash-case" },
  n = { "to_constant_case", "To CONSTANT_CASE" },
  ["."] = { "to_dot_case", "To dot.case" },
  p = { "to_phrase_case", "To Phrase case" },
  c = { "to_camel_case", "To camelCase" },
  P = { "to_pascal_case", "To PascalCase" },
  t = { "to_title_case", "To Title Case" },
  ["/"] = { "to_path_case", "To /path/case" },
}
local modemap = {
  operator = { "n", "ge" },
  visual = { "x", "ge" },
  current_word = { "n", "gew" },
  lsp_rename = { "n", "ger" },
}
for key, case_desc in pairs(keymap) do
  for fun, mode_prefix in pairs(modemap) do
    local case, desc = unpack(case_desc)
    local mode, prefix = unpack(mode_prefix)
    keys[#keys + 1] = {
      prefix .. key,
      function()
        require("textcase")[fun](case)
      end,
      mode = mode,
      desc = desc,
    }
  end
end
