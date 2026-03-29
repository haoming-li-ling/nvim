(local M {})

(fn wk_to_lazy_helper [key_table prefix]
  (let [lazy_table {}]
    (each [k v (pairs key_table)]
      (if (. v 1)
          (let [[rhs desc] v
                entry {1 (.. prefix k)
                       2 rhs
                       : desc
                       :silent (or v.silent true)
                       :mode v.mode}]
            (tset lazy_table (-> (length) (+ 1)) entry))
          (let [sub_table (wk_to_lazy_helper v (.. prefix k))]
            (each [_ map (ipairs sub_table)]
              (tset lazy_table (-> (length) (+ 1)) map)))))
    lazy_table))

M

