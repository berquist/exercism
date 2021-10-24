;;; luhn.el --- Luhn exercise (exercism)

;;; Commentary:

;;; Code:

(defun digit-string-to-list (digit-string)
  "Conver a string of digits (DIGIT-STRING) to a list of numbers."
  (mapcar
   (lambda (digit-char) (string-to-number (char-to-string digit-char)))
   (string-to-list digit-string)))

(defun make-below-ten (nums)
  (mapcar (lambda (num) (if (> num 9) (- num 9) num)) nums))

(defun scale-every-enth (nums scale enth)
  "SCALE every ENTH number in NUMS, starting from the right."
  (let ((result '())
        (counter 1))
    (dolist (idx (number-sequence (length nums) 1 -1))
      (if (= counter enth)
          (progn
            (push (* scale (nth (1- idx) nums)) result)
            (setq counter 1))
        (progn
          (push (nth (1- idx) nums) result)
          (setq counter (1+ counter)))))
    result))

(defun sum (things)
  (apply '+ things))

(defun luhn-p (arg)
  "Is the given ARG a Luhn number?"
  (let ((arg-nospaces (replace-regexp-in-string "[[:space:]]" "" arg)))
    (if (not (string= arg-nospaces
                      (replace-regexp-in-string "[[:alpha:][:punct:]]" "" arg-nospaces)))
        (error "arg has junk in it"))
    (and
     (not (<= (length arg-nospaces) 1))
     (zerop (mod (sum (make-below-ten (scale-every-enth (digit-string-to-list arg-nospaces) 2 2))) 10)))))

(provide 'luhn)
;;; luhn.el ends here
