(ns binary-search)

(defn search-for
  [val items]
  (loop [lo 0
         hi (- (count items) 1)]
    (if (> lo hi)
      (throw (js/Error "not found"))
      (let [mid (js/Math.floor (/ (+ lo hi) 2))
            candidate (nth items mid)]
        (cond
          (= candidate val) mid
          (< candidate val) (recur (+ mid 1) hi)
          (> candidate val) (recur lo (- mid 1)))))))

(defn middle [items]
  (js/Math.floor (/ (count items) 2.0)))
