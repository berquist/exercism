(ns binary-search
  (:require [clojure.math :as math]))

(defn search-for
  [val items]
  (loop [lo 0
         hi (- (count items) 1)]
    (if (> lo hi)
      (throw (Exception. "not found"))
      (let [mid (int (math/floor (/ (+ lo hi) 2)))
            candidate (nth items mid)]
        (cond
          (= candidate val) mid
          (< candidate val) (recur (+ mid 1) hi)
          (> candidate val) (recur lo (- mid 1)))))))

(defn middle [items]
  (int (math/floor (/ (count items) 2.0))))
