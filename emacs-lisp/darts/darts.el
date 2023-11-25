;;; darts.el --- Darts (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun score (x y)
  (let ((rad-outer 10)
        (rad-middle 5)
        (rad-inner 1)
        (radius (sqrt (+ (* x x) (* y y)))))
    (cond
         ((<= radius rad-inner) 10)
         ((<= radius rad-middle) 5)
         ((<= radius rad-outer) 1)
         (t 0))))


(provide 'darts)
;;; darts.el ends here
