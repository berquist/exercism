(ns pascals-triangle)

;; (defn factorial [n]
;;   (reduce * (range 1 (inc n))))

;; (defn binomial [n k]
;;   (/ (factorial n) (* (factorial k) (factorial (- n k)))))

;; (defn row [ith]
;;   (let [idx (dec ith)]
;;     (into [] (map #(binomial idx %) (range 0 (inc idx))))))

;; taken from
;; https://exercism.org/tracks/clojurescript/exercises/pascals-triangle/solutions/j0n3s;
;; factorial overflows the JS number for large n
(defn row [n]
  (if (= n 1)
    [1N]
    (->> (concat [0] (row (dec n)) [0])
         (partition 2 1)
         (map #(reduce + %)))))

(def triangle
  (->> (range)
       (map #(row (inc %)))))
