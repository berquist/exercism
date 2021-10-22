;;; binary.el --- Binary exercise (exercism)

;;; Commentary:

;;; Code:

(defun to-decimal (binary-string)
  (let ((dec 0)
        (bitchars (reverse (string-to-list binary-string))))
    (if (not (seq-some (lambda (x) (not (or (= x 48) (= x 49)))) bitchars))
        (dolist (place (number-sequence 0 (1- (length bitchars))))
          (let ((dig (string-to-number (char-to-string (nth place bitchars)))))
            (setq dec (+ dec (* dig (expt 2 place)))))))
    dec))


(provide 'binary)
;;; binary.el ends here
