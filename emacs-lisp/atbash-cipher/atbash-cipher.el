;;; atbash-cipher.el --- Atbash-Cipher (exercism)

;;; Commentary:

(require 'subr-x)

(defun atbash/zip (l1 l2)
  "Zip two lists together, the total length being shorter of the two lists."
  (let (results)
    (while (and l1 l2)
      (setq results (cons (cons (car l1) (car l2)) results)
            l1 (cdr l1)
            l2 (cdr l2)))
    (nreverse results)))

(defconst atbash/alphabet "abcdefghijklmnopqrstuvwxyz")
(defconst atbash/alphabet-rev (reverse atbash/alphabet))
;; Create an alist mapping the alphabet to its reverse.
(defconst atbash/map (atbash/zip
                      (string-to-list atbash/alphabet)
                      (string-to-list atbash/alphabet-rev)))

(defun atbash/encode-char (c)
  (or (alist-get c atbash/map) c))

(defun atbash/insert-every (string-to-insert group-size seq)
  (if seq
      (let ((result '())
            (len (length seq))
            (list-to-splice (nreverse (string-to-list string-to-insert))))
        (dotimes (i (length seq))
          (setq result (cons (car seq) result))
          (when (and (zerop (mod (1+ i) group-size)) (< (1+ i) len))
            (setq result (append list-to-splice result)))
          (setq seq (cdr seq)))
        (nreverse result))))

(defun encode (plaintext)
  "Encode PLAINTEXT to atbash-cipher encoding."
  (let* ((cleaned-text (replace-regexp-in-string "[^[:word:]]" "" (downcase plaintext)))
         (encoded-char-list (mapcar #'atbash/encode-char (string-to-list cleaned-text)))
         (chunked-encoded-char-list (atbash/insert-every " " 5 encoded-char-list)))
    (string-join (mapcar #'char-to-string chunked-encoded-char-list))))

(provide 'atbash-cipher)
;;; atbash-cipher.el ends here
