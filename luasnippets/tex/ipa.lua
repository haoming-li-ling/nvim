local ipa_map = {
  cg = "k",
  ck = "kʰ",
  kh = "kʰ",
  cj = "t͡ɕ",
  tc = "t͡ɕ",
  cq = "t͡ɕʰ",
  tch = "t͡ɕʰ",
  cx = "ɕ",
  cz = "t͡s",
  ts = "t͡s",
  cc = "t͡sʰ",
  tsh = "t͡sʰ",
  cs = "s",
  zh = "t͡ʂ",
  tS = "t͡ʂ",
  ch = "t͡ʂʰ",
  tSh = "t͡ʂʰ",
  sh = "ʂ",
  S = "ʂ",
  cr = "ʐ",
  Z = "ʐ",
}

local snips = {}

for k, v in pairs(ipa_map) do
  snips[#snips + 1] = snippet({ trig = k, wordTrig = false }, t(v), text_mode)
end

return snips
