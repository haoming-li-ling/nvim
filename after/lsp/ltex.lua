local path = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"
local words = {}

for word in io.open(path, "r"):lines() do
  table.insert(words, word)
end

return {
  autostart = false,
  settings = {
    ltex = {
      dictionary = {
        ["en-US"] = words,
      },
      disabledRules = {
        ["en-US"] = {
          "ALL_OF_THE",
          "COMMA_PARENTHESIS_WHITESPACE",
          "COMMA_PERIOD",
          "DOUBLE_PUNCTUATION",
          "MORFOLOGIK_RULE_EN_US",
          "UPPERCASE_SENTENCE_START",
        },
      },
    },
  },
}
