;;; raindrops.el --- Raindrops (exercism)

;;; Commentary:

;;; Code:

(require 'subr-x)

(defun convert (n)
  "Convert integer N to its raindrops string."
  (let ((result '()))
    (when (zerop (mod n 3)) (push "Pling" result))
    (when (zerop (mod n 5)) (push "Plang" result))
    (when (zerop (mod n 7)) (push "Plong" result))
    (if result
        (string-join (reverse result))
      (number-to-string n))))

(provide 'raindrops)
;;; raindrops.el ends here
