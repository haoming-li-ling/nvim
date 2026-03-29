(local ls (require :luasnip))
(local snippet ls.snippet)
(local sn ls.snippet_node)
(local isn ls.indent_snippet_node)
(local t ls.text_node)
(local i ls.insert_node)
(local c ls.choice_node)
(local d ls.dynamic_node)
(local r ls.restore_node)
(local fmta (. (require :luasnip.extras.fmt) :fmta))
(local ai (require :luasnip.nodes.absolute_indexer))
(local ne (. (require :luasnip.extras) :nonempty))

(local M {})

(set M.angle_brack {:delimiters "<>"})

(fn M.tex_math []
  (= 1 (vim.api.nvim_eval "vimtex#syntax#in_mathzone()")))

(fn M.tex_text []
  (not (M.tex_math)))

(fn M.range [end]
  (let [arr {}]
    (for [i 1 end 1]
      (tset arr i i))
    (ipairs arr)))

(fn M.tgg [s x y]
  (fn [args]
    (let [x (or x 1)
          y (or y 1)
          axy (. args x y)]
      (if (< 0 (length axy))
          s ""))))

(fn M.tg [s index]
  (ne index s ""))

;; fnlfmt: skip
(fn M.cp [index x fun y]
  (let [fun (or fun #$1)
          x (or x 1)
          y (or y 1)]
    (d index 
       (fn [args]
         (sn nil (i 1 (fun (. args x y))))) 
       x)))

(fn M.su [prefix suffix]
  (fn [s]
    (let [prefix (or prefix "")
          suffix (or suffix "")]
      (.. prefix s suffix))))

(fn M.o [fun1 fun2]
  (fn [s]
    (fun1 (fun2 s))))

(fn M.sn_visual_or_line [line text]
  (fn [args snip]
    (let [visual (. snip.env.TM_SELECTED_TEXT line)]
      (sn nil (i 1 (or visual text :text))))))

(fn M.vi [index text line]
  (d index (M.sn_visual_or_line (or line index 1) text)))

;; fnlfmt: skip
(fn rec_gen [bullet node]
  (fn temp []
    (sn nil [(c 1 [(t "") 
                   (sn nil [(t ["" bullet])
                            (node) 
                            (d 2 temp)])])]))

  temp)

(fn ng-node []
  (sn 1 [(i 1 :word) (t "[") (i 2 :gloss) (t "]")]))

(set M.rec_ls (rec_gen "  \\item " #(i 1)))

(set M.rec_ex (rec_gen "\\a " #(i 1)))

(set M.rec_gl (rec_gen "\\a " ng-node))

(fn M.table_node [args]
  (let [row (-> (. args 1 1) (: :gsub "%s" "") (: :gsub "|" ""))
        count (length row)
        tabs {}]
    (for [j 1 count 1]
      (tset tabs (-> j (* 2) (- 1)) (i j))
      (if (not= j count)
          (tset tabs (* j 2) (t " & "))))
    (sn nil tabs)))

(fn M.table_node_alt [args]
  (let [row (-> (. args 1 1) (: :gsub "%s" "") (: :gsub "|" ""))
        count (length row)
        tabs (icollect [j _ (M.range (-> count (* 2) (- 1)))]
               (if (-> j (% 2) (= 0))
                   (t " & ")
                   (i (-> j (/ 2) (math.floor) (+ 1)))))]
    (sn nil tabs)))

(lambda rec_table_gen [index indent]
  (fn temp []
    (sn nil [(c 1 [(t [""])
                   (sn nil [(t ["\\\\" indent])
                            (d 1 M.table_node (. ai index))
                            (d 2 temp)])])]))

  temp)

(lambda M.tableau [first rest]
  (fn [args]
    (let [tabs [(t (string.format "\\%s{" first)) (i 1) (t "}") (t " ")]
          cells (-> args (. 1 1) (: :gsub "%s" "") (: :gsub "[|:]" ""))
          count (length cells)]
      (for [j 1 count 1]
        (tset tabs (-> j (* 2) (+ 3))
              (sn (+ j 1) (fmta (string.format "\\%s{<>}" rest) (i 1))))
        (if (not= j count)
            (tset tabs (-> j (* 2) (+ 4)) (t " "))))
      (sn nil tabs))))

(set M.rec_table (rec_table_gen 1 ""))

(set M.rec_table_full (rec_table_gen 4 "  "))

M
