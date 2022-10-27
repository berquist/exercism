(ns pascals-triangle)

(defn row [n]
  (if (= n 1)
    [1N]
    (->> (concat [0] (row (dec n)) [0])
         (partition 2 1)
         (map #(reduce + %)))))

(def triangle
  (->> (range)
       (map #(row (inc %)))))
