;; extends

(section
  command: _ @markup.heading.3.markdown (#set! @markup.heading.3.markdown conceal "§")
  toc: _* @toc (#set! @toc conceal ""))

(section
  text: (curly_group
          "{" @lbrace (#set! @lbrace conceal " ")
          _ @markup.heading.3.markdown
          "}" @rbrace (#set! @rbrace conceal "")))

(subsection
  command: _ @markup.heading.3.markdown (#set! @markup.heading.3.markdown conceal "§")
  toc: _* @toc (#set! @toc conceal ""))

(subsection
  text: (curly_group
          "{" @lbrace (#set! @lbrace conceal " ")
          _ @markup.heading.3.markdown
          "}" @rbrace (#set! @rbrace conceal "")))


(subsubsection
  command: _ @markup.heading.3.markdown (#set! @markup.heading.3.markdown conceal "§")
  toc: _* @toc (#set! @toc conceal ""))

(subsubsection
  text: (curly_group
          "{" @lbrace (#set! @lbrace conceal " ")
          _ @markup.heading.3.markdown
          "}" @rbrace (#set! @rbrace conceal "")))
          

(citation) @nospell

(label_definition) @nospell 

(placeholder) @variable.parameter

(key_value_pair
  key: _ @variable.parameter) 

(key_value_pair
  value: _ @keyword.exception)

(generic_environment
  begin: (begin 
           name: (curly_group_text 
                   text: _ @keyword.exception))
  end: (end 
         name: (curly_group_text 
                 text: _ @keyword.exception)))

((generic_command
   command: (command_name) @_name (#any-of? @_name "\\footnote")
   arg: (curly_group
          _* @markup.footnote)))

("\\item" @punctuation.special @conceal (#set! conceal "○"))

(text_mode
  command: _ @conceal (#set! conceal ""))

(inline_formula
  "\\(" @lmath (#set! @lmath conceal "")
  "\\)" @lmath (#set! @lmath conceal ""))

(["\\left"
  "\\right"] @conceal (#set! conceal ""))

(label_definition
  command: _ @markup.link
  (#set! @markup.link conceal "󰌕")
  name: (curly_group_label
         "{" @lbrace (#set! @lbrace conceal " ")
         "}" @rbrace (#set! @rbrace conceal "")))

(label_reference
  command: _ @markup.link
  (#set! @markup.link conceal "󰌕")
  names: (curly_group_label_list
          "{" @lbrace (#set! @lbrace conceal " ")
          "}" @rbrace (#set! @rbrace conceal "")))

(citation
  command: _ @markup.link
  (#set! @markup.link conceal "󰴚󰌹󰌷")
  keys: (curly_group_text_list
         "{" @lbrace (#set! @lbrace conceal " ")
         "}" @rbrace (#set! @rbrace conceal "")))


(generic_command
  command: (command_name) @command
  (#any-of? @command "\\ee" "\\vv" "\\LL")
  arg: (curly_group
         "{" @lbrace (#set! @lbrace conceal "")
         "}" @rbrace (#set! @rbrace conceal ".")))
  ; arg: (curly_group
  ;        "{" @llbrace (#set! @llbrace conceal " ")
  ;        "}" @rrbrace (#set! @rrbrace conceal "")))

(generic_command
  command: (command_name) @command
  (#any-of? @command "\\ee" "\\vv" "\\LL")
  (_) 
  arg: (curly_group
         "{" @lbrace (#set! @lbrace conceal " ")
         "}" @rbrace (#set! @rbrace conceal "")))

(generic_command
  command: (command_name) @conceal
  (#eq? @conceal "\\LL")
  (#set! @conceal conceal "λ"))

(generic_command
  command: (command_name) @conceal
  (#eq? @conceal "\\vv") 
  (#set! @conceal conceal "∀"))

(generic_command
  command: (command_name) @conceal
  (#eq? @conceal "\\ee")
  (#set! @conceal conceal "∃"))



(generic_command
  command: (command_name) @conceal
  (#any-of? @conceal "\\sem")
  (#set-pairs! @conceal conceal "\\sem" "⟦")
  arg: (curly_group
         "{" @lbrace (#set! @lbrace conceal "")
         "}" @rbrace (#set! @rbrace conceal "⟧")))

(generic_command
  command: (command_name) @conceal
  (#any-of? @conceal "\\set")
  (#set-pairs! @conceal conceal "\\set" "{")
  arg: (curly_group
         "{" @lbrace (#set! @lbrace conceal "")
         "}" @rbrace (#set! @rbrace conceal "}")))

(generic_command
  command: (command_name) @conceal
  (#any-of? @conceal "\\abs")
  (#set-pairs! @conceal conceal "\\abs" "|")
  arg: (curly_group
         "{" @lbrace (#set! @lbrace conceal "")
         "}" @rbrace (#set! @rbrace conceal "|")))

(generic_command
  command: (command_name) @conceal
  (#any-of? @conceal "\\type")
  (#set-pairs! @conceal conceal "\\type" "⟨")
  arg: (curly_group
         "{" @lbrace (#set! @lbrace conceal "")
         "}" @rbrace (#set! @rbrace conceal "⟩")))

(generic_command 
  command: (command_name) @conceal 
  (#any-of? @conceal 
   "\\\\"
   "\\{" 
   "\\}" 
   "\\#"
   "\\,"
   "\\hfill"
   "\\ex"
   "\\a"
   "\\b"
   "\\c"
   "\\d"
   "\\e"
   "\\f"
   "\\g"
   "\\z"
   "\\begingl"
   "\\gla"
   "\\glb"
   "\\glft"
   "\\endgl"
   "\\glpreamble"
   "\\endpreamble")
  (#set-pairs! @conceal conceal 
   "\\\\" "⏎"
   "\\{" "{" 
   "\\}" "}" 
   "\\#" "#"
   "\\," ""
   "\\hfill" "󰌒"
   "\\ex" "x"
   "\\a" "a"
   "\\b" "b"
   "\\c" "c"
   "\\d" "d"
   "\\e" "e"
   "\\f" "f"
   "\\g" "g"
   "\\z" "z"
   "\\begingl" "«注"
   "\\gla" "󰊄原"
   "\\glb" "释"
   "\\glft" "󰗊译"
   "\\endgl" "∎完"
   "\\glpreamble" "፦前"
   "\\endpreamble" "∎完"
   "\\emph" ""
   "\\mathit" ""
   "\\textit" ""
   "\\mathbf" ""
   "\\textbf" ""))


(text_mode
  command: _ @function @nospell
  content: (curly_group
             "{" @lbrace (#set! @lbrace conceal "")
             (_)* @spell @variable
             "}" @rbrace (#set! @rbrace conceal "")))

; [(displayed_equation)
;  (inline_formula)] @nospell @markup.math 


((word) @conceal (#any-of? @conceal "@") (#set! @conceal conceal ""))

(generic_command
  command: (command_name) @command
  (#eq? @command "\\lab")
  ; (#set! @command conceal "[")
  (#set! @command conceal "")
  arg: (curly_group
         "{" @lbrace (#set! @lbrace conceal "")
         (_)* @markup.italic
         "}" @rbrace (#set! @rbrace conceal "")))

(generic_command
  command: (command_name) @command
  (#eq? @command "\\clab")
  (#set! @command conceal "]"))

(generic_command
  command: (command_name) @command
  (#any-of? @command 
   "\\nogloss" 
   "\\nog" 
   "\\emph" 
   "\\textit" 
   "\\textbf" 
   "\\mathit" 
   "\\mathbf" 
   "\\operatorname"
   "\\op"
   "\\textsc" 
   "\\symbf" 
   "\\symbit" 
   "\\mathsf" 
   "\\textsf" 
   "\\underline" 
   "\\ul"
   "\\underLine")
  (#set! @command conceal "")
  arg: (curly_group
         "{" @lbrace (#set! @lbrace conceal "")
         "}" @rbrace (#set! @rbrace conceal "")))

(generic_command
  command: (command_name) @command
  (#any-of? @command "\\textsc")
  arg: (curly_group
         (_)* @markup.strong))

(generic_command
  command: (command_name) @command
  (#any-of? @command "\\mathsf" "\\textsf")
  arg: (curly_group
         (_)* @keyword))

(generic_command
  command: (command_name) @command
  (#any-of? @command "\\underline" "\\ul" "\\underLine")
  arg: (curly_group) @markup.underline)

(generic_command
  command: (command_name) @gap (#eq? @gap "\\gap") (#set! @gap conceal "_＿")
  arg: (curly_group  
         "{" @lbrace (#set! @lbrace conceal "")
         (_)* @conceal
         (#any-of? @conceal "1" "2" "3" "4" "5" "i" "j" "k")
         (#set-pairs! @conceal conceal 
          "0" "₀"
          "1" "₁"
          "2" "₂"
          "3" "₃"
          "4" "₄"
          "5" "₅"
          "6" "₆"
          "7" "₇"
          "8" "₈"
          "9" "₉"
          "a" "ₐ"
          "e" "ₑ"
          "h" "ₕ"
          "i" "ᵢ"
          "j" "ⱼ"
          "k" "ₖ"
          "l" "ₗ"
          "m" "ₘ"
          "n" "ₙ"
          "o" "ₒ"
          "p" "ₚ"
          "r" "ᵣ"
          "s" "ₛ"
          "t" "ₜ"
          "u" "ᵤ"
          "v" "ᵥ"
          "x" "ₓ")
         "}" @rbrace (#set! @rbrace conceal "")))

((generic_command
   command: (command_name) @conceal 
   (#any-of? @conceal 
    "\\ldots")
   (#set-pairs! @conceal conceal 
    "\\ldots" "…")))


((generic_command
   command: (command_name)
   arg: (curly_group)) @markup.math
 (#any-of? @markup.math
  "\\mathbb{A}" "\\mathbb{B}" "\\mathbb{C}" "\\mathbb{D}" "\\mathbb{E}" 
  "\\mathbb{F}" "\\mathbb{G}" "\\mathbb{H}" "\\mathbb{I}" "\\mathbb{J}" 
  "\\mathbb{K}" "\\mathbb{L}" "\\mathbb{M}" "\\mathbb{N}" "\\mathbb{O}" 
  "\\mathbb{P}" "\\mathbb{Q}" "\\mathbb{R}" "\\mathbb{S}" "\\mathbb{T}" 
  "\\mathbb{U}" "\\mathbb{V}" "\\mathbb{W}" "\\mathbb{X}" "\\mathbb{Y}" 
  "\\mathbb{Z}" "\\mathsf{a}" "\\mathsf{b}" "\\mathsf{c}" "\\mathsf{d}" 
  "\\mathsf{e}" "\\mathsf{f}" "\\mathsf{g}" "\\mathsf{h}" "\\mathsf{i}" 
  "\\mathsf{j}" "\\mathsf{k}" "\\mathsf{l}" "\\mathsf{m}" "\\mathsf{n}" 
  "\\mathsf{o}" "\\mathsf{p}" "\\mathsf{q}" "\\mathsf{r}" "\\mathsf{s}" 
  "\\mathsf{t}" "\\mathsf{u}" "\\mathsf{v}" "\\mathsf{w}" "\\mathsf{x}" 
  "\\mathsf{y}" "\\mathsf{z}" "\\mathsf{A}" "\\mathsf{B}" "\\mathsf{C}" 
  "\\mathsf{D}" "\\mathsf{E}" "\\mathsf{F}" "\\mathsf{G}" "\\mathsf{H}" 
  "\\mathsf{I}" "\\mathsf{J}" "\\mathsf{K}" "\\mathsf{L}" "\\mathsf{M}" 
  "\\mathsf{N}" "\\mathsf{O}" "\\mathsf{P}" "\\mathsf{Q}" "\\mathsf{R}" 
  "\\mathsf{S}" "\\mathsf{T}" "\\mathsf{U}" "\\mathsf{V}" "\\mathsf{W}" 
  "\\mathsf{X}" "\\mathsf{Y}" "\\mathsf{Z}" "\\mathfrak{a}" "\\mathfrak{b}" 
  "\\mathfrak{c}" "\\mathfrak{d}" "\\mathfrak{e}" "\\mathfrak{f}" "\\mathfrak{g}" 
  "\\mathfrak{h}" "\\mathfrak{i}" "\\mathfrak{j}" "\\mathfrak{k}" "\\mathfrak{l}" 
  "\\mathfrak{m}" "\\mathfrak{n}" "\\mathfrak{o}" "\\mathfrak{p}" "\\mathfrak{q}" 
  "\\mathfrak{r}" "\\mathfrak{s}" "\\mathfrak{t}" "\\mathfrak{u}" "\\mathfrak{v}" 
  "\\mathfrak{w}" "\\mathfrak{x}" "\\mathfrak{y}" "\\mathfrak{z}" "\\mathfrak{A}" 
  "\\mathfrak{B}" "\\mathfrak{C}" "\\mathfrak{D}" "\\mathfrak{E}" "\\mathfrak{F}" 
  "\\mathfrak{G}" "\\mathfrak{H}" "\\mathfrak{I}" "\\mathfrak{J}" "\\mathfrak{K}" 
  "\\mathfrak{L}" "\\mathfrak{M}" "\\mathfrak{N}" "\\mathfrak{O}" "\\mathfrak{P}" 
  "\\mathfrak{Q}" "\\mathfrak{R}" "\\mathfrak{S}" "\\mathfrak{T}" "\\mathfrak{U}" 
  "\\mathfrak{V}" "\\mathfrak{W}" "\\mathfrak{X}" "\\mathfrak{Y}" "\\mathfrak{Z}" 
  "\\mathscr{A}" "\\mathscr{B}" "\\mathscr{C}" "\\mathscr{D}" "\\mathscr{E}" 
  "\\mathscr{F}" "\\mathscr{G}" "\\mathscr{H}" "\\mathscr{I}" "\\mathscr{J}" 
  "\\mathscr{K}" "\\mathscr{L}" "\\mathscr{M}" "\\mathscr{N}" "\\mathscr{O}" 
  "\\mathscr{P}" "\\mathscr{Q}" "\\mathscr{R}" "\\mathscr{S}" "\\mathscr{T}" 
  "\\mathscr{U}" "\\mathscr{V}" "\\mathscr{W}" "\\mathscr{X}" "\\mathscr{Y}" 
  "\\mathscr{Z}" "\\mathcal{A}" "\\mathcal{B}" "\\mathcal{C}" "\\mathcal{D}" 
  "\\mathcal{E}" "\\mathcal{F}" "\\mathcal{G}" "\\mathcal{H}" "\\mathcal{I}" 
  "\\mathcal{J}" "\\mathcal{K}" "\\mathcal{L}" "\\mathcal{M}" "\\mathcal{N}" 
  "\\mathcal{O}" "\\mathcal{P}" "\\mathcal{Q}" "\\mathcal{R}" "\\mathcal{S}" 
  "\\mathcal{T}" "\\mathcal{U}" "\\mathcal{V}" "\\mathcal{W}" "\\mathcal{X}" 
  "\\mathcal{Y}" "\\mathcal{Z}" 
  "\\ldots{}")
 (#set-pairs! @markup.math conceal
  "\\ldots{}" "…"
  "\\mathbb{A}" "𝔸"
  "\\mathbb{B}" "𝔹"
  "\\mathbb{C}" "ℂ"
  "\\mathbb{D}" "𝔻"
  "\\mathbb{E}" "𝔼"
  "\\mathbb{F}" "𝔽"
  "\\mathbb{G}" "𝔾"
  "\\mathbb{H}" "ℍ"
  "\\mathbb{I}" "𝕀"
  "\\mathbb{J}" "𝕁"
  "\\mathbb{K}" "𝕂"
  "\\mathbb{L}" "𝕃"
  "\\mathbb{M}" "𝕄"
  "\\mathbb{N}" "ℕ"
  "\\mathbb{O}" "𝕆"
  "\\mathbb{P}" "ℙ"
  "\\mathbb{Q}" "ℚ"
  "\\mathbb{R}" "ℝ"
  "\\mathbb{S}" "𝕊"
  "\\mathbb{T}" "𝕋"
  "\\mathbb{U}" "𝕌"
  "\\mathbb{V}" "𝕍"
  "\\mathbb{W}" "𝕎"
  "\\mathbb{X}" "𝕏"
  "\\mathbb{Y}" "𝕐"
  "\\mathbb{Z}" "ℤ"
  "\\mathsf{a}" "𝖺"
  "\\mathsf{b}" "𝖻"
  "\\mathsf{c}" "𝖼"
  "\\mathsf{d}" "𝖽"
  "\\mathsf{e}" "𝖾"
  "\\mathsf{f}" "𝖿"
  "\\mathsf{g}" "𝗀"
  "\\mathsf{h}" "𝗁"
  "\\mathsf{i}" "𝗂"
  "\\mathsf{j}" "𝗃"
  "\\mathsf{k}" "𝗄"
  "\\mathsf{l}" "𝗅"
  "\\mathsf{m}" "𝗆"
  "\\mathsf{n}" "𝗇"
  "\\mathsf{o}" "𝗈"
  "\\mathsf{p}" "𝗉"
  "\\mathsf{q}" "𝗊"
  "\\mathsf{r}" "𝗋"
  "\\mathsf{s}" "𝗌"
  "\\mathsf{t}" "𝗍"
  "\\mathsf{u}" "𝗎"
  "\\mathsf{v}" "𝗏"
  "\\mathsf{w}" "𝗐"
  "\\mathsf{x}" "𝗑"
  "\\mathsf{y}" "𝗒"
  "\\mathsf{z}" "𝗓"
  "\\mathsf{A}" "𝖠"
  "\\mathsf{B}" "𝖡"
  "\\mathsf{C}" "𝖢"
  "\\mathsf{D}" "𝖣"
  "\\mathsf{E}" "𝖤"
  "\\mathsf{F}" "𝖥"
  "\\mathsf{G}" "𝖦"
  "\\mathsf{H}" "𝖧"
  "\\mathsf{I}" "𝖨"
  "\\mathsf{J}" "𝖩"
  "\\mathsf{K}" "𝖪"
  "\\mathsf{L}" "𝖫"
  "\\mathsf{M}" "𝖬"
  "\\mathsf{N}" "𝖭"
  "\\mathsf{O}" "𝖮"
  "\\mathsf{P}" "𝖯"
  "\\mathsf{Q}" "𝖰"
  "\\mathsf{R}" "𝖱"
  "\\mathsf{S}" "𝖲"
  "\\mathsf{T}" "𝖳"
  "\\mathsf{U}" "𝖴"
  "\\mathsf{V}" "𝖵"
  "\\mathsf{W}" "𝖶"
  "\\mathsf{X}" "𝖷"
  "\\mathsf{Y}" "𝖸"
  "\\mathsf{Z}" "𝖹"
  "\\mathfrak{a}" "𝔞"
  "\\mathfrak{b}" "𝔟"
  "\\mathfrak{c}" "𝔠"
  "\\mathfrak{d}" "𝔡"
  "\\mathfrak{e}" "𝔢"
  "\\mathfrak{f}" "𝔣"
  "\\mathfrak{g}" "𝔤"
  "\\mathfrak{h}" "𝔥"
  "\\mathfrak{i}" "𝔦"
  "\\mathfrak{j}" "𝔧"
  "\\mathfrak{k}" "𝔨"
  "\\mathfrak{l}" "𝔩"
  "\\mathfrak{m}" "𝔪"
  "\\mathfrak{n}" "𝔫"
  "\\mathfrak{o}" "𝔬"
  "\\mathfrak{p}" "𝔭"
  "\\mathfrak{q}" "𝔮"
  "\\mathfrak{r}" "𝔯"
  "\\mathfrak{s}" "𝔰"
  "\\mathfrak{t}" "𝔱"
  "\\mathfrak{u}" "𝔲"
  "\\mathfrak{v}" "𝔳"
  "\\mathfrak{w}" "𝔴"
  "\\mathfrak{x}" "𝔵"
  "\\mathfrak{y}" "𝔶"
  "\\mathfrak{z}" "𝔷"
  "\\mathfrak{A}" "𝔄"
  "\\mathfrak{B}" "𝔅"
  "\\mathfrak{C}" "ℭ"
  "\\mathfrak{D}" "𝔇"
  "\\mathfrak{E}" "𝔈"
  "\\mathfrak{F}" "𝔉"
  "\\mathfrak{G}" "𝔊"
  "\\mathfrak{H}" "ℌ"
  "\\mathfrak{I}" "ℑ"
  "\\mathfrak{J}" "𝔍"
  "\\mathfrak{K}" "𝔎"
  "\\mathfrak{L}" "𝔏"
  "\\mathfrak{M}" "𝔐"
  "\\mathfrak{N}" "𝔑"
  "\\mathfrak{O}" "𝔒"
  "\\mathfrak{P}" "𝔓"
  "\\mathfrak{Q}" "𝔔"
  "\\mathfrak{R}" "ℜ"
  "\\mathfrak{S}" "𝔖"
  "\\mathfrak{T}" "𝔗"
  "\\mathfrak{U}" "𝔘"
  "\\mathfrak{V}" "𝔙"
  "\\mathfrak{W}" "𝔚"
  "\\mathfrak{X}" "𝔛"
  "\\mathfrak{Y}" "𝔜"
  "\\mathfrak{Z}" "ℨ"
  "\\mathscr{A}" "𝓐"
  "\\mathscr{B}" "𝓑"
  "\\mathscr{C}" "𝓒"
  "\\mathscr{D}" "𝓓"
  "\\mathscr{E}" "𝓔"
  "\\mathscr{F}" "𝓕"
  "\\mathscr{G}" "𝓖"
  "\\mathscr{H}" "𝓗"
  "\\mathscr{I}" "𝓘"
  "\\mathscr{J}" "𝓙"
  "\\mathscr{K}" "𝓚"
  "\\mathscr{L}" "𝓛"
  "\\mathscr{M}" "𝓜"
  "\\mathscr{N}" "𝓝"
  "\\mathscr{O}" "𝓞"
  "\\mathscr{P}" "𝓟"
  "\\mathscr{Q}" "𝓠"
  "\\mathscr{R}" "𝓡"
  "\\mathscr{S}" "𝓢"
  "\\mathscr{T}" "𝓣"
  "\\mathscr{U}" "𝓤"
  "\\mathscr{V}" "𝓥"
  "\\mathscr{W}" "𝓦"
  "\\mathscr{X}" "𝓧"
  "\\mathscr{Y}" "𝓨"
  "\\mathscr{Z}" "𝓩"
  "\\mathcal{A}" "𝓐"
  "\\mathcal{B}" "𝓑"
  "\\mathcal{C}" "𝓒"
  "\\mathcal{D}" "𝓓"
  "\\mathcal{E}" "𝓔"
  "\\mathcal{F}" "𝓕"
  "\\mathcal{G}" "𝓖"
  "\\mathcal{H}" "𝓗"
  "\\mathcal{I}" "𝓘"
  "\\mathcal{J}" "𝓙"
  "\\mathcal{K}" "𝓚"
  "\\mathcal{L}" "𝓛"
  "\\mathcal{M}" "𝓜"
  "\\mathcal{N}" "𝓝"
  "\\mathcal{O}" "𝓞"
  "\\mathcal{P}" "𝓟"
  "\\mathcal{Q}" "𝓠"
  "\\mathcal{R}" "𝓡"
  "\\mathcal{S}" "𝓢"
  "\\mathcal{T}" "𝓣"
  "\\mathcal{U}" "𝓤"
  "\\mathcal{V}" "𝓥"
  "\\mathcal{W}" "𝓦"
  "\\mathcal{X}" "𝓧"
  "\\mathcal{Y}" "𝓨"
  "\\mathcal{Z}" "𝓩"))

(generic_command
  command: ((command_name) @markup.math
                           (#any-of? @markup.math
                            "\\alpha" "\\beta" "\\gamma" "\\delta"
                            "\\epsilon" "\\varepsilon" "\\zeta" "\\eta"
                            "\\theta" "\\vartheta" "\\iota" "\\kappa"
                            "\\lambda" "\\mu" "\\nu" "\\xi"
                            "\\pi" "\\varpi" "\\rho" "\\varrho"
                            "\\sigma" "\\varsigma" "\\tau" "\\upsilon"
                            "\\phi" "\\varphi" "\\chi" "\\psi"
                            "\\omega" "\\Gamma" "\\Delta" "\\Theta"
                            "\\Lambda" "\\Xi" "\\Pi" "\\Sigma"
                            "\\Upsilon" "\\Phi" "\\Chi" "\\Psi"
                            "\\Omega"))
  ; (#has-ancestor? @conceal math_environment inline_formula displayed_equation)
  ; (#not-has-ancestor? @conceal label_definition text_mode)
  (#set-pairs! @markup.math conceal 
   "\\alpha" "α" 
   "\\beta" "β"
   "\\gamma" "γ"
   "\\delta" "δ"
   "\\epsilon" "ϵ"
   "\\varepsilon" "ε"
   "\\zeta" "ζ"
   "\\eta" "η"
   "\\theta" "θ"
   "\\vartheta" "ϑ"
   "\\iota" "ι"
   "\\kappa" "κ"
   ; "\\lambda" "λ"
   "\\mu" "μ"
   "\\nu" "ν"
   "\\xi" "ξ"
   "\\pi" "π"
   "\\varpi" "ϖ"
   "\\rho" "ρ"
   "\\varrho" "ϱ"
   "\\sigma" "σ"
   "\\varsigma" "ς"
   "\\tau" "τ"
   "\\upsilon" "υ"
   "\\phi" "ϕ"
   "\\varphi" "φ"
   "\\chi" "χ"
   "\\psi" "ψ"
   "\\omega" "ω"
   "\\Gamma" "Γ"
   "\\Delta" "Δ"
   "\\Theta" "Θ"
   "\\Lambda" "Λ"
   "\\Xi" "Ξ"
   "\\Pi" "Π"
   "\\Sigma" "Σ"
   "\\Upsilon" "Υ"
   "\\Phi" "Φ"
   "\\Chi" "Χ"
   "\\Psi" "Ψ"
   "\\Omega" "Ω"))

(generic_command
  command: ((command_name) @operator
                           (#any-of? @operator
                            "\\lambda"
                            "\\|" "\\amalg" "\\angle" "\\approx" 
                            "\\ast" "\\asymp" "\\backslash" "\\bigcap" 
                            "\\bigcirc" "\\bigcup" "\\bigodot" "\\bigoplus" 
                            "\\bigotimes" "\\bigsqcup" "\\bigtriangledown" "\\bigtriangleup" 
                            "\\bigvee" "\\bigwedge" "\\bot" "\\Box" "\\bowtie" "\\bullet"
                            "\\cap" "\\cdot" "\\cdots" "\\circ" "\\cong" "\\coprod" 
                            "\\copyright" "\\cup" "\\dagger" "\\dashv" "\\ddagger" 
                            "\\ddots" "\\diamond" "\\Diamond" "\\div" "\\doteq" "\\dots" 
                            "\\downarrow" "\\Downarrow" "\\equiv" "\\exists" "\\flat" 
                            "\\forall" "\\frown" "\\ge" "\\geq" "\\gets" "\\gg" "\\hookleftarrow" 
                            "\\hookrightarrow" "\\iff" "\\Im" "\\in" "\\int" "\\jmath" 
                            "\\land" "\\lceil" "\\ldots" "\\le"
                            "\\leadsto" "\\left" "\\leftarrow" "\\Leftarrow" 
                            "\\leftharpoondown" "\\leftharpoonup" "\\leftrightarrow" "\\Leftrightarrow" 
                            "\\longrightarrow" "\\longleftarrow" "\\Longrightarrow" "\\Longleftarrow" "\\Longleftrightarrow"
                            "\\leq" "\\leq" "\\lfloor" "\\ll" "\\lmoustache" "\\lnot" "\\lor" "\\mapsto" 
                            "\\mid" "\\models" "\\mp" "\\nabla" "\\natural" "\\ne" "\\nearrow" 
                            "\\neg" "\\neq" "\\ni" "\\notin" "\\nwarrow" "\\odot" "\\oint" 
                            "\\ominus" "\\oplus" "\\oslash" "\\otimes" "\\owns" "\\P" 
                            "\\parallel" "\\partial" "\\perp" "\\pm" "\\prec" "\\preceq" 
                            "\\prime" "\\prod" "\\propto" "\\rceil" "\\Re" "\\quad" "\\qquad" 
                            "\\rfloor" "\\right" "\\rightarrow" "\\Rightarrow" "\\rightleftharpoons" 
                            "\\rmoustache" "\\S" "\\searrow" "\\setminus" "\\sharp" "\\sim" 
                            "\\simeq" "\\smile" "\\sqcap" "\\sqcup" "\\sqsubset" "\\sqsubseteq" 
                            "\\sqsupset" "\\sqsupseteq" "\\star" "\\subset" "\\subseteq" 
                            "\\succ" "\\succeq" "\\sum" "\\supset" "\\supseteq" 
                            "\\surd" "\\swarrow" "\\times" "\\to" "\\top" 
                            "\\triangle" "\\triangleleft" "\\triangleright" "\\uparrow" 
                            "\\Uparrow" "\\updownarrow" "\\Updownarrow" "\\vdash" "\\vdots" 
                            "\\vee" "\\wedge" "\\wp" "\\wr"))
  ; (#has-ancestor? @text.math math_environment inline_formula displayed_equation)
  ; (#not-has-ancestor? @text.math label_definition text_mode)
  (#set-pairs! @operator conceal
   "\\lambda" "λ"
   "\\|" "‖"
   "\\amalg" "∐"
   "\\angle" "∠"
   "\\approx" "≈"
   "\\ast" "∗"
   "\\asymp" "≍"
   "\\backslash" "∖"
   "\\bigcap" "∩"
   "\\bigcirc" "○"
   "\\bigcup" "∪"
   "\\bigodot" "⊙"
   "\\bigoplus" "⊕"
   "\\bigotimes" "⊗"
   "\\bigsqcup" "⊔"
   "\\bigtriangledown" "∇"
   "\\bigtriangleup" "∆"
   "\\bigvee" "⋁"
   "\\bigwedge" "⋀"
   "\\bot" "⊥"
   "\\Box" "□"
   "\\bowtie" "⋈"
   "\\bullet" "•"
   "\\cap" "∩"
   "\\cdot" "·"
   "\\cdots" "⋯"
   "\\circ" "∘"
   "\\cong" "≅"
   "\\coprod" "∐"
   "\\copyright" "©"
   "\\cup" "∪"
   "\\dagger" "†"
   "\\dashv" "⊣"
   "\\ddagger" "‡"
   "\\ddots" "⋱"
   "\\diamond" "⋄"
   "\\Diamond" "◇"
   "\\div" "÷"
   "\\doteq" "≐"
   "\\dots" "…"
   "\\downarrow" "↓"
   "\\Downarrow" "⇓"
   "\\equiv" "≡"
   "\\exists" "∃"
   "\\flat" "♭"
   "\\forall" "∀"
   "\\frown" "⁔"
   "\\ge" "≥"
   "\\geq" "≥"
   "\\gets" "←"
   "\\gg" "⟫"
   "\\hookleftarrow" "↩"
   "\\hookrightarrow" "↪"
   "\\iff" "⇔"
   "\\Im" "ℑ"
   "\\in" "∈"
   "\\int" "∫"
   "\\jmath" "𝚥"
   "\\land" "∧"
   "\\lceil" "⌈"
   "\\ldots" "…"
   "\\le" "≤"
   "\\leadsto" "↝"
   "\\left" ""
   "\\leftarrow" "←"
   "\\Leftarrow" "⇐"
   "\\longleftarrow" "←"
   "\\Longleftarrow" "⇐"
   "\\leftharpoondown" "↽"
   "\\leftharpoonup" "↼"
   "\\leftrightarrow" "↔"
   "\\Leftrightarrow" "⇔"
   "\\longleftrightarrow" "↔"
   "\\Longleftrightarrow" "⇔"
   "\\leq" "≤"
   "\\leq" "≤"
   "\\lfloor" "⌊"
   "\\ll" "≪"
   "\\lmoustache" "╭"
   "\\lnot" "¬"
   "\\lor" "∨"
   "\\mapsto" "↦"
   "\\mid" "∣"
   "\\models" "╞"
   "\\mp" "∓"
   "\\nabla" "∇"
   "\\natural" "♮"
   "\\ne" "≠"
   "\\nearrow" "↗"
   "\\neg" "¬"
   "\\neq" "≠"
   "\\ni" "∋"
   "\\notin" "∉"
   "\\nwarrow" "↖"
   "\\odot" "⊙"
   "\\oint" "∮"
   "\\ominus" "⊖"
   "\\oplus" "⊕"
   "\\oslash" "⊘"
   "\\otimes" "⊗"
   "\\owns" "∋"
   "\\P" "¶"
   "\\parallel" "║"
   "\\partial" "∂"
   "\\perp" "⊥"
   "\\pm" "±"
   "\\prec" "≺"
   "\\preceq" "⪯"
   "\\prime" "′"
   "\\prod" "∏"
   "\\propto" "∝"
   "\\rceil" "⌉"
   "\\Re" "ℜ"
   "\\quad" " "
   "\\qquad" " "
   "\\rfloor" "⌋"
   "\\right" ""
   "\\rightarrow" "→"
   "\\Rightarrow" "⇒"
   "\\longrightarrow" "→"
   "\\Longrightarrow" "⇒"
   "\\rightleftharpoons" "⇌"
   "\\rmoustache" "╮"
   "\\S" "§"
   "\\searrow" "↘"
   "\\setminus" "∖"
   "\\sharp" "♯"
   "\\sim" "∼"
   "\\simeq" "⋍"
   "\\smile" "‿"
   "\\sqcap" "⊓"
   "\\sqcup" "⊔"
   "\\sqsubset" "⊏"
   "\\sqsubseteq" "⊑"
   "\\sqsupset" "⊐"
   "\\sqsupseteq" "⊒"
   "\\star" "✫"
   "\\subset" "⊂"
   "\\subseteq" "⊆"
   "\\succ" "≻"
   "\\succeq" "⪰"
   "\\sum" "∑"
   "\\supset" "⊃"
   "\\supseteq" "⊇"
   "\\surd" "√"
   "\\swarrow" "↙"
   "\\times" "×"
   "\\to" "→"
   "\\top" "⊤"
   "\\triangle" "∆"
   "\\triangleleft" "⊲"
   "\\triangleright" "⊳"
   "\\uparrow" "↑"
   "\\Uparrow" "⇑"
   "\\updownarrow" "↕"
   "\\Updownarrow" "⇕"
   "\\vdash" "⊢"
   "\\vdots" "⋮"
   "\\vee" "∨"
   "\\wedge" "∧"
   "\\wp" "℘"
   "\\wr" "≀"))
   

(generic_command
  command: ((command_name) @markup.math
                           (#any-of? @markup.math 
                            "\\aleph" "\\clubsuit" "\\diamondsuit" "\\heartsuit"
                            "\\spadesuit" "\\ell" "\\emptyset" "\\varnothing"
                            "\\hbar" "\\imath" "\\infty"))
  ; (#has-ancestor? @text.math math_environment inline_formula displayed_equation)
  ; (#not-has-ancestor? @text.math label_definition text_mode)
  (#set-pairs! @markup.math conceal
   "\\aleph" "ℵ"
   "\\clubsuit" "♣"
   "\\diamondsuit" "♢"
   "\\heartsuit" "♡"
   "\\spadesuit" "♠"
   "\\ell" "ℓ"
   "\\emptyset" "∅"
   "\\varnothing" "∅"
   "\\hbar" "ℏ"
   "\\imath" "ɩ"
   "\\infty" "∞"))

; Comments
[(line_comment)
 (block_comment)
 (comment_environment)] @comment @spell

(text
  word: (subscript) @conceal
  (#has-ancestor? @conceal math_environment inline_formula displayed_equation)
  (#not-has-ancestor? @conceal text_mode label_definition)
  (#any-of? @conceal 
   "_0" "_1" "_2" "_3" "_4" "_5" "_6" "_7" "_8" "_9"
   "_a" "_e" "_h" "_i" "_j" "_k" "_l" "_m" "_n" "_o" "_p" "_r" "_s" "_t"
   "_u" "_v" "_x" "_\\.")
  (#set-pairs! @conceal conceal
   "_0" "₀"
   "_1" "₁"
   "_2" "₂"
   "_3" "₃"
   "_4" "₄"
   "_5" "₅"
   "_6" "₆"
   "_7" "₇"
   "_8" "₈"
   "_9" "₉"
   "_a" "ₐ"
   "_e" "ₑ"
   "_h" "ₕ"
   "_i" "ᵢ"
   "_j" "ⱼ"
   "_k" "ₖ"
   "_l" "ₗ"
   "_m" "ₘ"
   "_n" "ₙ"
   "_o" "ₒ"
   "_p" "ₚ"
   "_r" "ᵣ"
   "_s" "ₛ"
   "_t" "ₜ"
   "_u" "ᵤ"
   "_v" "ᵥ"
   "_x" "ₓ"
   "_\\." "‸"))

(text
  word: (word) @conceal
  (#has-ancestor? @conceal subscript)
  (#has-ancestor? @conceal math_environment inline_formula displayed_equation)
  (#not-has-ancestor? @conceal text_mode label_definition)
  (#any-of? @conceal 
   "0" "1" "2" "3" "4" "5" "6" "7" "8" "9"
   "a" "e" "h" "i" "j" "k" "l" "m" "n" "o" "p" "r" "s" "t" "u" "v" "x" "\\.")
  (#set-pairs! @conceal conceal
   "0" "₀"
   "1" "₁"
   "2" "₂"
   "3" "₃"
   "4" "₄"
   "5" "₅"
   "6" "₆"
   "7" "₇"
   "8" "₈"
   "9" "₉"
   "a" "ₐ"
   "e" "ₑ"
   "h" "ₕ"
   "i" "ᵢ"
   "j" "ⱼ"
   "k" "ₖ"
   "l" "ₗ"
   "m" "ₘ"
   "n" "ₙ"
   "o" "ₒ"
   "p" "ₚ"
   "r" "ᵣ"
   "s" "ₛ"
   "t" "ₜ"
   "u" "ᵤ"
   "v" "ᵥ"
   "x" "ₓ"
   "_\\." "‸"))
