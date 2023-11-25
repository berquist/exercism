;;; matching-brackets.el --- Matching Brackets (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defconst --openings '("[" "(" "{"))
(defconst --closings '("]" ")" "}"))
(defconst --closing-to-opening
  '(("]" . "[")
    (")" . "(")
    ("}" . "{")))

(defun is-paired (value)
  (let ((stack '()))
    (catch 'not-matching
      (dolist (c (split-string value "" t))
        (cond ((member c --openings)
               (push c stack))
              ((member c --closings)
               (when (not stack)
                 (throw 'not-matching nil))
               (when (not (string= (pop stack)
                                   (alist-get c --closing-to-opening nil nil 'string=)))
                 (throw 'not-matching nil)))))
      (not stack))))


(provide 'matching-brackets)
;;; matching-brackets.el ends here
