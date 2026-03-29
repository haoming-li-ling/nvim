local sym_table = {
  rr = { "rightarrow", "→" },
  Rr = { "Rightarrow", "⇒" },
  lr = { "leftrightarrow", "↔" },
  Lr = { "Leftrightarrow", "⇔" },
  lrr = { "leftarrow", "←" },
  Lrr = { "Leftarrow", "⇐" },
  lnrr = { "longrightarrow", "⟶" },
  Lnrr = { "Longrightarrow", "⟹" },
  Lnlr = { "Longleftrightarrow", "⟺" },
  oo = { "infty", "∞" },
  ee = { "exists", "∃" },
  vv = { "forall", "∀" },
  ff = { "forall", "∀" },
  emp = { "emptyset", "∅" },
  nn = { "emptyset", "∅" },
  llbr = { "llbracket", "⟦" },
  rrbr = { "rrbracket", "⟧" },
  lang = { "langle", "⟨" },
  rang = { "rangle", "⟩" },
  -- ["o+"] = [[\oplus]],
}

local snips = {}
for k, v in pairs(sym_table) do
  local command, symbol = unpack(v)
  local prefix_command = [[\]] .. command
  snips[#snips + 1] = snippet(k, t(prefix_command), math_mode)
  snips[#snips + 1] = snippet({ trig = prefix_command, priority = 1100 }, t(symbol), math_mode)
  snips[#snips + 1] = snippet(symbol, t(prefix_command), math_mode)
end

local auto_sym_table = {
  ["and"] = { "land", "∧" },
  ["And"] = { "bigwedge", "⋀" },
  ["or"] = { "lor", "∨" },
  ["Or"] = { "bigvee", "⋁" },
  ["not"] = { "lnot", "¬" },
  neg = { "neg", "¬" },
  dia = { "Diamond", "◇" },
  box = { "Box", "☐" },
  to = { "to", "→" },
  bot = { "bot", "⊥" },
  top = { "top", "⊤" },
  times = { "times", "✕" },
  cup = { "cup", "∪" },
  cap = { "cap", "∩" },
  Cup = { "bigcup", "⋃" },
  Cap = { "bigcap", "⋂" },
  sub = { "subseteq", "⊆" },
  sup = { "supseteq", "⊇" },
  sqsub = { "sqsubseteq", "⊑" },
  sqsup = { "sqsupseteq", "⊒" },
  sbs = { "subset", "⊂" },
  sps = { "supset", "⊃" },
  sqsbs = { "sqsubset", "⊏" },
  sqsps = { "sqsupset", "⊐" },
  neq = { "neq", "≠" },
  geq = { "geq", "≥" },
  leq = { "leq", "≤" },
  plus = { "oplus", "⊕" },
  Plus = { "bigoplus", "⨁" },
  succ = { "succ", "≻" },
  prec = { "prec", "≺" },
  lead = { "leadsto", "⇝" },
  map = { "mapsto", "↦" },
  ["in"] = { "in", "∈" },
  nin = { "notin", "∉" },
}

local auto_snips = {}
for k, v in pairs(auto_sym_table) do
  local command, symbol = unpack(v)
  local prefix_command = [[\]] .. command
  auto_snips[#auto_snips + 1] = snippet({
    trig = "(.)" .. k,
    regTrig = true,
    wordTrig = false,
  }, {
    f(function(_, snip)
      local c1 = snip.captures[1]
      if c1:find("%w") or c1:find("\\") then
        return c1 .. k
      else
        return c1 .. prefix_command
      end
    end),
  }, math_mode)
  snips[#snips + 1] = snippet(prefix_command, t(symbol), math_mode)
  snips[#snips + 1] = snippet(symbol, t(prefix_command), math_mode)
end

return snips, auto_snips
