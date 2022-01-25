(ns collatz-conjecture)

(defn collatz-iter [num]
  (if (zero? (mod num 2))
    (/ num 2)
    (+ (* num 3) 1)))

(defn collatz
  ([num]
   (collatz num 0))
  ([num counter]
   (if (= num 1)
     counter
     (collatz (collatz-iter num) (+ counter 1)))))
