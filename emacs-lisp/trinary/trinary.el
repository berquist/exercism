;;; trinary.el --- Trinary (exercism)

;;; Commentary:

;;; Code:

(require 'seq)

(defun trinary-to-decimal (trinary-string)
  (let* ((digit-strings (reverse (remove "" (split-string trinary-string ""))))
         (filtered-digit-strings (seq-filter (lambda (digit-string) (or (string= digit-string "0")
                                                                        (string= digit-string "1")
                                                                        (string= digit-string "2")))
                                             digit-strings))
         (acc 0))
    (if (= (length digit-strings) (length filtered-digit-strings))
        (dolist (i (number-sequence 0 (1- (length digit-strings))))
          (let* ((digit (string-to-number (nth i digit-strings)))
                 (fac (expt 3 i))
                 (contrib (* digit fac)))
            (setq acc (+ acc contrib)))))
    acc))


(provide 'trinary)
;;; trinary.el ends here
