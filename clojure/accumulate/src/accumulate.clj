(ns accumulate)

(defn accumulate
  "Map a function to a sequence without using map."
  [fun xs]
  (if (empty? xs)
    xs
    (loop [head (list (fun (first xs)))
           tail (rest xs)]
      (if (empty? tail)
        head
        (recur
         (concat head (list (fun (first tail))))
         (rest tail))))))
