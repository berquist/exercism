;;; bob.el --- Bob exercise (exercism)

;;; Commentary:

;;; Code:

(defun is-silence (prompt-string)
  (string= prompt-string ""))

(defun is-question (prompt-string)
  (eq (car (last (string-to-list prompt-string))) ?\?))

(defun is-yelling (prompt-string)
  (string= prompt-string (upcase prompt-string)))

(defun is-yelling-question (prompt-string)
  (and (is-yelling prompt-string) (is-question prompt-string)))

(defun is-numeric (prompt-string)
  "Does the PROMPT-STRING not contain any letters (just numbers and punctuation)?"
  (string= (replace-regexp-in-string "[[:digit:][:punct:][:space:]]" "" prompt-string) ""))

(defun response-for (prompt)
  (let ((cleaned-prompt (replace-regexp-in-string "[[:space:]]" "" prompt)))
    (cond
     ((is-silence cleaned-prompt) "Fine. Be that way!")
     ((and (is-question cleaned-prompt) (is-numeric cleaned-prompt)) "Sure.")
     ((is-numeric cleaned-prompt) "Whatever.")
     ((is-yelling-question cleaned-prompt) "Calm down, I know what I'm doing!")
     ((is-yelling cleaned-prompt) "Whoa, chill out!")
     ((is-question cleaned-prompt) "Sure.")
     (t "Whatever."))))

(provide 'bob)
;;; bob.el ends here
