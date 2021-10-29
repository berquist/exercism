;;; acronym.el --- Acronym (exercism)

;;; Commentary:

;;; Code:

(require 'subr-x)

(defun acronym (phrase)
  (string-join
   (mapcar (lambda (str) (upcase (char-to-string (string-to-char str))))
           (split-string phrase "[ -]+"))))

(provide 'acronym)
;;; acronym.el ends here
