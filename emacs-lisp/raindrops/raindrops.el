;;; raindrops.el --- Raindrops (exercism)

;;; Commentary:

;;; Code:

(require 'subr-x)

(defun convert (n)
  "Convert integer N to its raindrops string."
  (let ((result '()))
    (when (= (mod n 3) 0) (setq result (cons "Pling" result)))
    (when (= (mod n 5) 0) (setq result (cons "Plang" result)))
    (when (= (mod n 7) 0) (setq result (cons "Plong" result)))
    (if result
        (string-join (reverse result))
      (number-to-string n))))

(provide 'raindrops)
;;; raindrops.el ends here
