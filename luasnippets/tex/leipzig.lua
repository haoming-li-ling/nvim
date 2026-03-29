local acr_table = {
  "aarg",
  "abl",
  "abs",
  "acc",
  "adj",
  "adv",
  "agr",
  "all",
  "antip",
  "appl",
  "art",
  "aux",
  "ben",
  "caus",
  "clf",
  "cl",
  "com",
  "comp",
  "compl",
  "cond",
  "cop",
  "cvb",
  "dat",
  "decl",
  "def",
  "dem",
  "det",
  "dist",
  "distr",
  "du",
  "dur",
  "erg",
  "excl",
  "f",
  "foc",
  "fut",
  "gen",
  "imp",
  "incl",
  "ind",
  "indf",
  "inf",
  "ins",
  "intr",
  "ipfv",
  "irr",
  "loc",
  "m",
  "n",
  "neg",
  "nmlz",
  "nom",
  "obj",
  "obl",
  "parg",
  "pass",
  "pfv",
  "pl",
  "poss",
  "pred",
  "prf",
  "prs",
  "prog",
  "proh",
  "prox",
  "pst",
  "ptcp",
  "purp",
  "q",
  "quot",
  "recp",
  "refl",
  "rel",
  "res",
  "sarg",
  "sbj",
  "sbjv",
  "sg",
  "top",
  "tr",
  "voc",
  "first",
  "second",
  "third",
  "exp",
  "ger",
  "npst",
}
local snips = {}

for _, v in ipairs(acr_table) do
  local hd, tl = v:sub(1, 1), v:sub(2, #v)
  local cmd = [[\]] .. hd:upper() .. tl .. [[{}]]
  local acr_cmd = [[\acrlong{]] .. v .. [[}]]
  local Acr_cmd = [[\Acrlong{]] .. v .. [[}]]
  snips[#snips + 1] = snippet({ trig = "lz" .. v }, {
    t(cmd),
  })
  snips[#snips + 1] = snippet({ trig = v .. "lz" }, {
    t(cmd),
  })
  snips[#snips + 1] = snippet({ trig = "al" .. v }, {
    t(acr_cmd),
  })
  snips[#snips + 1] = snippet({ trig = v .. "al" }, {
    t(acr_cmd),
  })
  snips[#snips + 1] = snippet({ trig = "Al" .. v }, {
    t(Acr_cmd),
  })
  snips[#snips + 1] = snippet({ trig = v .. "Al" }, {
    t(Acr_cmd),
  })
end

return snips
