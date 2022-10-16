(ns raindrops
  (:require [clojure.string :as s]))

(defn convert [n]
  (let [strs (remove nil?
                     [(when (zero? (mod n 3)) "Pling")
                      (when (zero? (mod n 5)) "Plang")
                      (when (zero? (mod n 7)) "Plong")])]
    (if (empty? strs)
      (str n)
      (s/join strs))))
