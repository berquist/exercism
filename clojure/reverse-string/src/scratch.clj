(defn reverse-string [s]
  (if (= (count s) 1)
    s
    (str (reverse-string (clojure.string/join (rest s))) (first s))))
