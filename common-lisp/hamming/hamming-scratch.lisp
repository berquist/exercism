      ;; (reduce #'+ (mapcar (lambda (v1 v2) (if (eq v1 v2) 0 1))
      ;;                     (map nil #'princ dna1)
      ;;                     (map nil #'princ dna2)))))

(defun hamming-distance (dna1 dna2)
  "Determine number of mutations between DNA strands by computing the Hamming Distance.

https://exercism.io/tracks/common-lisp/exercises/hamming/solutions/d0327f6fa4aa4eee8ba2601262b0e01e
"
  (when (= (length dna1) (length dna2))
    (loop for x across dna1
         for y across dna2
         counting (not (char-equal x y)))))


(defun hamming-distance (dna1 dna2)
  "https://exercism.io/tracks/common-lisp/exercises/hamming/solutions/051299f358384f2cb56a1d2c9b10aba5"
  (if (= (length dna1) (length dna2))
    (loop  
          for char1 across dna1
          for char2 across dna2
          count (char/= char1 char2))))
