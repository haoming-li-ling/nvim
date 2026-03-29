local greek_table = {
  a = { [[alpha]], "α" },
  b = { [[beta]], "β" },
  g = { [[gamma]], "γ" },
  G = { [[Gamma]], "Γ" },
  d = { [[delta]], "δ" },
  D = { [[Delta]], "Δ" },
  e = { [[epsilon]], "ϵ" },
  z = { [[zeta]], "ζ" },
  h = { [[eta]], "η" },
  q = { [[theta]], "θ" },
  Q = { [[Theta]], "Θ" },
  i = { [[iota]], "ι" },
  k = { [[kappa]], "κ" },
  l = { [[lambda]], "λ" },
  L = { [[Lambda]], "Λ" },
  m = { [[mu]], "μ" },
  n = { [[nu]], "ν" },
  x = { [[xi]], "ξ" },
  p = { [[pi]], "π" },
  P = { [[Pi]], "Π" },
  r = { [[rho]], "ρ" },
  s = { [[sigma]], "σ" },
  S = { [[Sigma]], "Σ" },
  t = { [[tau]], "τ" },
  u = { [[upsilon]], "υ" },
  f = { [[varphi]], "φ" },
  F = { [[Phi]], "Φ" },
  c = { [[chi]], "χ" },
  y = { [[psi]], "ψ" },
  Y = { [[Psi]], "Ψ" },
  w = { [[omega]], "ω" },
  W = { [[Omega]], "Ω" },
}

local snips = {}

for k, v in pairs(greek_table) do
  local command, symbol = unpack(v)
  snips[#snips + 1] = snippet(k, t([[\]] .. command), math_mode)
  snips[#snips + 1] = snippet([[\]] .. command, t(symbol), math_mode)
  snips[#snips + 1] = snippet(symbol, t([[\]] .. command), math_mode)
end

-- snips[#snips + 1] = snippet("\\varphi", { t("\\phi") }, math_mode)
-- snips[#snips + 1] = snippet("\\phi", { t("\\varphi") }, math_mode)

return snips
