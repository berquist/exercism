;;; two-fer.el --- Two-fer Exercise (exercism)

;;; Commentary:

;;; Code:

(defun two-fer (&optional name)
  (let ((person name))
    (if (null person)
        (setq person "you"))
    (format "One for %s, one for me." person)))


(provide 'two-fer)
;;; two-fer.el ends here
