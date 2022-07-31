;;; run-length-encoding.el --- run-length-encoding Exercise (exercism)

;;; Commentary:

;;; Code:

(require 'subr-x)

(defun run-length-encode (to-encode)
  (let ((input-length (length to-encode)))
    (cond
     ((= input-length 0) "")
     ((= input-length 1) (format "1%s" to-encode))
     (:else
      ;; Iterate over the characters in the string.
      ;; - If the current character matches the previous character, bump that character's count by 1.
      ;; - If it doesn't, write the count and the character to output.
      ;; Set the previous character to the current character.
      (let* ((counter-char-pairs '())
             (chars (string-to-list to-encode))
             (counter 1)
             (pos 1)
             (prev-char (nth (1- pos) chars))
             (current-char (nth pos chars)))
        (while (< pos input-length)
          (if (not (eql prev-char current-char))
              (setq counter-char-pairs (cons (list counter prev-char) counter-char-pairs)
                    counter 1)
            (setq counter (1+ counter)))
          (setq prev-char current-char
                pos (1+ pos)
                current-char (nth pos chars)))
        ;; Don't forget the last character in the string.
        (setq counter-char-pairs (cons (list counter prev-char) counter-char-pairs))
        (string-join (mapcar
                      (lambda (counter-char-pair)
                        (let ((num (car counter-char-pair)))
                          (if (> num 1)
                              (concat (number-to-string num)
                                      (char-to-string (cadr counter-char-pair)))
                            (char-to-string (cadr counter-char-pair)))))
                      (reverse counter-char-pairs))))))))

(defun char-is-num (char)
  ;; string "0" to "9" as character
  (and (>= char 48) (<= char 57)))

(defun repeat-char (char times)
  (make-string times char))

(defun run-length-decode (to-decode)
  (let* ((input-length (length to-decode))
         (counter-list '())
         (acc '())
         (chars (string-to-list to-decode))
         (pos 0)
         (current-char (nth pos chars)))
    (while (< pos input-length)
      ;; - If current char is digit, push current char to counter-list
      ;; - Else, concat counter-list and convert to num, pass num and
      ;;   current-char to repeat-char, clear counter-list, push repeated
      ;;   char to acc
      (if (char-is-num current-char)
          (push (char-to-string current-char) counter-list)
        (progn
          (let* ((counter-string (string-join (reverse counter-list)))
                 (repeated-string (repeat-char current-char (string-to-number counter-string))))
            (if (not (string-empty-p repeated-string))
                (progn
                  (push repeated-string acc)
                  (setq counter-list '()))
              (push (char-to-string current-char) acc)))))
      (setq pos (1+ pos)
            current-char (nth pos chars)))
    (string-join (reverse acc))))

(provide 'run-length-encoding)
;;; run-length-encoding.el ends here
