;;; roman-numerals.el --- roman-numerals Exercise (exercism)

;;; Commentary:

(require 'subr-x)

(defun rn/get-digits (n)
  "Extract the individual digits of number N into a list of numbers."
  (let ((digits '()))
    (while (>= n 10)
      (push (mod n 10) digits)
      (setq n (/ n 10)))
    (push n digits)
    digits))

(defmacro rn/handle-digit (digit letter-base letter-mid letter-next)
  `(cond
    ((= ,digit 9)
     (push (format "%s%s" ,letter-mid ,letter-next) acc))
    ((> ,digit 4)
     (push ,letter-mid acc)
     (mapc #'(lambda (_) (push ,letter-base acc)) (number-sequence 1 (- ,digit 5))))
    ((= ,digit 4)
     (push (format "%s%s" ,letter-base ,letter-mid) acc))
    (t
     (mapc #'(lambda (_) (push ,letter-base acc)) (number-sequence 1 ,digit)))))

(defun to-roman (value)
  (let* ((digits (nreverse (rn/get-digits value)))
         (nd (length digits)))
    (when (<= 1 nd 4)
      (let ((strs '()))
        (if (>= nd 4)
            (let ((d (nth 3 digits)))
              (mapc #'(lambda (_) (push "M" strs)) (number-sequence 1 d))))
        (if (>= nd 3)
            (rn/handle-digit (nth 2 digits) "C" "D" "M"))
        (if (>= nd 2)
            (let ((d (nth 1 digits)))
              (cond
               ((= d 9)
                (push "XC" strs))
               ((> d 4)
                (push "L" strs)
                (mapc #'(lambda (_) (push "X" strs)) (number-sequence 1 (- d 5))))
               ((= d 4)
                (push "XL" strs))
               (t
                (mapc #'(lambda (_) (push "X" strs)) (number-sequence 1 d))))))
        (if (>= nd 1)
            (let ((d (nth 0 digits)))
              (cond
               ((= d 9)
                (push "IX" strs))
               ((> d 4)
                (push "V" strs)
                (mapc #'(lambda (_) (push "I" strs)) (number-sequence 1 (- d 5))))
               ((= d 4)
                (push "IV" strs))
               (t
                (mapc #'(lambda (_) (push "I" strs)) (number-sequence 1 d))))))
        (string-join (nreverse strs))))))

(provide 'roman-numerals)
;;; roman-numerals.el ends here
