;;; all-your-base.el --- All Your Base (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defun ayb--to-decimal (list-of-digits in-base)
  "Convert a LIST-OF-DIGITS from base IN-BASE to a single number in decimal."
  (let ((max-idx (1- (seq-length list-of-digits))))
    (apply #'+
           (mapcar
            #'(lambda (idx)
                (let ((digit (nth (- max-idx idx) list-of-digits)))
                  (if (and (>= digit 0) (< digit in-base))
                      (* digit
                         (expt in-base idx))
                    (error "bad digit"))))
            (number-sequence max-idx 0 -1)))))

(defun ayb--get-digits-base (n out-base)
  "Convert a number N in decimal to a list of digits in base OUT-BASE."
  (let ((digits '()))
    (while (>= n out-base)
      (push (mod n out-base) digits)
      (setq n (/ n out-base)))
    (push n digits)
    digits))

(defun rebase (list-of-digits in-base out-base)
  (if (and (> in-base 1) (> out-base 1))
      (ayb--get-digits-base (ayb--to-decimal list-of-digits in-base) out-base)
    (error "bad input arguments")))

(provide 'all-your-base)
;;; all-your-base.el ends here
