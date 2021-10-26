;;; difference-of-squares.el --- Difference of Squares (exercism)

;;; Commentary:

;;; Code:

(defun sum (things)
  (apply '+ things))

(defun square (n)
  (* n n))

(defun square-of-sum (n)
  (square (sum (number-sequence 1 n))))

(defun sum-of-squares (n)
  (sum (mapcar 'square (number-sequence 1 n))))

(defun difference (n)
  (- (square-of-sum n)
     (sum-of-squares n)))

(provide 'difference-of-squares)
;;; difference-of-squares.el ends here
