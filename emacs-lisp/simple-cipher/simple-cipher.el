;;; simple-cipher.el --- Simple Cipher (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defconst sc/char-min (string-to-char "a"))
(defconst sc/char-max (string-to-char "z"))
(defconst sc/char-range (- sc/char-max sc/char-min))

(defun sc--get-real-key-index (key index)
  (let ((len (length key))
        (real-index index))
    (if (not (zerop len))
        (while (>= real-index len)
          (setq real-index (- real-index len))))
    real-index))

(defun sc--make-shift (chars-key i)
  (- (nth (sc--get-real-key-index chars-key i) chars-key) sc/char-min))

(defun sc--make-forward-shifted-char (char-pt shift)
  "Shift CHAR-PT forward by SHIFT number of ASCII letters,
wrapping around from Z to A."
  (let ((real-char (+ char-pt shift)))
    (while (> real-char sc/char-max)
      (setq real-char (- real-char sc/char-range 1)))
    real-char))

(defun sc--make-backward-shifted-char (char-ct shift)
  "Shift CHAR-CT backward by SHIFT number of ASCII letters,
wrapping around from A to Z."
  (let ((real-char (- char-ct shift)))
    (while (< real-char sc/char-min)
      (setq real-char (+ real-char sc/char-range 1)))
    real-char))

(defun encode (plaintext key)
  (let ((chars-pt (string-to-list plaintext))
        (chars-key (string-to-list key))
        (encoded '()))
    (dotimes (i (length chars-pt))
      (let* ((shift (sc--make-shift chars-key i))
             (char-shifted (sc--make-forward-shifted-char (nth i chars-pt) shift)))
        (push char-shifted encoded)))
    (concat (reverse encoded))))

(defun decode (ciphertext key)
  (let ((chars-ct (string-to-list ciphertext))
        (chars-key (string-to-list key))
        (decoded '()))
    (dotimes (i (length chars-ct))
      (let* ((shift (sc--make-shift chars-key i))
             (char-shifted (sc--make-backward-shifted-char (nth i chars-ct) shift)))
        (push char-shifted decoded)))
    (concat (reverse decoded))))

(defun generate-key (&optional keylen)
  (let ((keylen (or keylen 100)))
    (concat
     (mapcar (lambda (_) (+ (random (1+ sc/char-range)) sc/char-min))
             (number-sequence 1 keylen)))))


(provide 'simple-cipher)
;;; simple-cipher.el ends here
