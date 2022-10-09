;;; perfect-numbers.el --- perfect-numbers Exercise (exercism)

;;; Commentary:

;;; Code:

(require 'cl-seq)

(defun get-factors (number)
  "Get all the factors of a NUMBER, not including the number itself.

Adapted from https://exercism.org/tracks/emacs-lisp/exercises/perfect-numbers/solutions/quigonjeff
"
  (let* ((candidates (number-sequence 1 (1+ (floor (sqrt number)))))
         (low-factors (cl-remove-if-not #'(lambda (i) (= (mod number i) 0)) candidates))
         (high-factors (mapcar #'(lambda (i) (/ number i)) low-factors)))
    (cl-remove-duplicates (append low-factors high-factors) :test #'eql)))

(defun sum (nums)
  (apply '+ nums))

(defun classify (number)
  "Do something with NUMBER here."
  (if (> number 0)
      (let* ((factors (get-factors number))
             (aliquot-sum (- (sum factors) number)))
        (cond
         ((> aliquot-sum number) 'abundant)
         ((< aliquot-sum number) 'deficient)
         (t 'perfect)))
    (error "Classification is only possible for natural numbers")))

(provide 'perfect-numbers)
;;; perfect-numbers.el ends here
