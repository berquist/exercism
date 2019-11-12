(defpackage #:hamming
  (:use #:cl)
  (:export #:distance))

(in-package #:hamming)

(defun distance (dna1 dna2)
  "Number of positional differences in two equal length dna strands."
  (if (not (eq (length dna1) (length dna2)))
      nil
      (loop for i from 0 to (1- (length dna1))
            sum (if (eq (char dna1 i) (char dna2 i)) 0 1))))
