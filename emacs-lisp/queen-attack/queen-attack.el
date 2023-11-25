;;; queen-attack.el --- Queen Attack (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun valid-position-p (queen)
  (let ((n 8)
        (row (car queen))
        (col (cdr queen)))
    (and (<= 0 row (1- n))
         (<= 0 col (1- n)))))

(defun same-row (white-queen black-queen)
  (= (car white-queen) (car black-queen)))

(defun same-col (white-queen black-queen)
  (= (cdr white-queen) (cdr black-queen)))

(defun are-diagonal (white-queen black-queen)
  (let ((maxr (max (car white-queen) (car black-queen)))
        (minr (min (car white-queen) (car black-queen)))
        (maxc (max (cdr white-queen) (cdr black-queen)))
        (minc (min (cdr white-queen) (cdr black-queen))))
    (= (- maxr minr) (- maxc minc))))

(defun can-attack-p (white-queen black-queen)
  (or (same-row white-queen black-queen)
      (same-col white-queen black-queen)
      (are-diagonal white-queen black-queen)))


(provide 'queen-attack)
;;; queen-attack.el ends here
