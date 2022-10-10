;;; crypto-square.el --- Crypto Square (exercism)

;;; Commentary:

(require 'cl-extra)
(require 'subr-x)

(defun cs/rect-rows-and-columns (nelements)
  "Compute a number of rows and columns that would hold NELEMENTS.

The number of rows and columns fulfill the conditions `c >= r`
and `c - r <= 1`.
"
  (let* ((sqrt-dec-and-frac (cl-floor (sqrt nelements)))
         (sqrt-dec (car sqrt-dec-and-frac))
         (sqrt-frac (cadr sqrt-dec-and-frac))
         (nrows (if (> sqrt-frac 0.5) (1+ sqrt-dec) sqrt-dec))
         (ncols (if (< (expt nrows 2) nelements) (1+ nrows) nrows)))
    (cons nrows ncols)))

(defun cs/transpose-absolute-index (original nr nc)
  (let ((ir (/ original nc))
        (ic (% original nc)))
    (+ (* ic nr) ir)))

(defun atbash/insert-every (string-to-insert group-size seq)
  (if seq
      (let ((result '())
            (len (length seq))
            (list-to-splice (nreverse (string-to-list string-to-insert))))
        (dotimes (i (length seq))
          ;; TODO rewrite to use push
          (setq result (cons (car seq) result))
          (when (and (zerop (mod (1+ i) group-size)) (< (1+ i) len))
            (setq result (append list-to-splice result)))
          (setq seq (cdr seq)))
        (nreverse result))))

(defun encipher (plaintext)
  (let* ((cleaned-text (downcase (replace-regexp-in-string "[^[:alnum:]]" "" plaintext)))
         (nchars (length cleaned-text))
         (rect-rows-and-columns (cs/rect-rows-and-columns nchars))
         (nr (car rect-rows-and-columns))
         (nc (cdr rect-rows-and-columns))
         (nt (* nr nc))
         (ne (- nt nchars))
         ;; 32 is the character code for a space
         (expanded-text (string-to-list (concat cleaned-text (make-string ne 32))))
         (transposed-text (make-list nt 32)))
    (mapc
     #'(lambda (orig-idx)
         (let ((new-idx (cs/transpose-absolute-index orig-idx nr nc)))
           (setf (nth new-idx transposed-text) (nth orig-idx expanded-text))))
     (number-sequence 0 (1- (length expanded-text))))
    (string-join (mapcar #'char-to-string (atbash/insert-every " " nr transposed-text)))))

;; Once the plain text is in rectangular form, the fundamental operation is
;; taking the matrix transpose.

;; original
;; [1, 3] is absolute position (1*nc) + 3 = (1*8) + 3 = 8 + 3 = 11
;; ir = (/ 11 8) = 1
;; ic = (% 11 8) = 3

;; result
;; [3, 1], nr = 8, nc = 7
;; (3*nc) + 1 = (3*7) + 1 = 22

(provide 'crypto-square)
;;; crypto-square.el ends here
