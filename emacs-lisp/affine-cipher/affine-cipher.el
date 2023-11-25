;;; affine-cipher.el --- Affine Cipher (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)
(require 'cl-seq)
(require 'subr-x)

(defun atbash/insert-every (string-to-insert group-size seq)
  (if seq
      (let ((result '())
            (len (length seq))
            (list-to-splice (nreverse (string-to-list string-to-insert))))
        (dotimes (i len)
          (setq result (cons (car seq) result))
          (when (and (zerop (mod (1+ i) group-size)) (< (1+ i) len))
            (setq result (append list-to-splice result)))
          (setq seq (cdr seq)))
        (nreverse result))))

(defun alist-get-str (key alist)
  "Get the value for string KEY from the ALIST."
  (alist-get key alist nil nil #'string=))

(defun quigonjeff/get-factors (number)
  "Get all the factors of a NUMBER, not including the number itself.

Adapted from https://exercism.org/tracks/emacs-lisp/exercises/perfect-numbers/solutions/quigonjeff
"
  (let* ((candidates (number-sequence 1 (1+ (floor (sqrt number)))))
         (low-factors (cl-remove-if-not #'(lambda (i) (= (mod number i) 0)) candidates))
         (high-factors (mapcar #'(lambda (i) (/ number i)) low-factors)))
    (cl-remove-duplicates (append low-factors high-factors) :test #'eql)))

(defun affine/are-coprime (x y)
  "Are the numbers X and Y coprime?

Two numbers are coprime if they do not share any prime factors other than 1."
  (let ((x-factors (quigonjeff/get-factors x))
        (y-factors (quigonjeff/get-factors y)))
    (equal (cl-intersection x-factors y-factors)
           '(1))))

(defun affine/inverse (a n)
  ;; https://en.wikipedia.org/wiki/Extended_Euclidean_algorithm#Modular_integers
  (let ((tv 0)
        (r n)
        (newt 1)
        (newr a))
    (while (not (zerop newr))
      (let ((quotient (/ r newr))
            (tmp-newt newt)
            (tmp-newr newr))
        (setq newt (- tv (* quotient tmp-newt))
              newr (- r (* quotient tmp-newr))
              tv tmp-newt
              r tmp-newr)))
    (when (> r 1)
      (error "a is not invertible"))
    (when (< tv 0)
      (setq tv (+ tv n)))
    tv))

(defun affine/encode-char (a i b m)
  "Equation for encoding a character via the affine cipher."
  (mod (+ (* a i) b) m))

(defun affine/decode-char (a y b m)
  "Equation for decoding a character via the affine cipher."
  (mod (* (affine/inverse a m) (- y b)) m))

(defun encode (phrase key)
  (let ((a (alist-get-str "a" key))
        (b (alist-get-str "b" key))
        (m 26)
        (ascii-start 97))
    (when (not (affine/are-coprime a m))
      (error "a and m must be coprime."))
    (string-join
     (mapcar
      #'char-to-string
      (atbash/insert-every
       " "
       5
       (mapcar
        (lambda (s)
          (let ((c (string-to-char s)))
            (if (<= ascii-start c (1- (+ ascii-start m)))
                (+ (affine/encode-char a (- c ascii-start) b m) ascii-start)
              c)))
        (split-string (replace-regexp-in-string "[[:space:][:punct:]]" "" (downcase phrase)) "" t)))))))

(defun decode (phrase key)
  (let ((a (alist-get-str "a" key))
        (b (alist-get-str "b" key))
        (m 26)
        (ascii-start 97))
    (when (not (affine/are-coprime a m))
      (error "a and m must be coprime."))
    (string-join
     (mapcar
      #'char-to-string
      (mapcar
       (lambda (s)
         (let ((c (string-to-char s)))
           (if (<= ascii-start c (1- (+ ascii-start m)))
               (+ (affine/decode-char a (- c ascii-start) b m) ascii-start)
             c)))
       (split-string (replace-regexp-in-string "[[:space:]]" "" phrase) "" t))))))


(provide 'affine-cipher)
;;; affine-cipher.el ends here
