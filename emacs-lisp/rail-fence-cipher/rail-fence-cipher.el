;;; rail-fence-cipher.el --- Rail Fence Cipher (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

;; Useful if you just want the alternating sequence.
;; (defun make-rail-indices-2 (nchar nrail)
;;   (let ((irail 0)
;;         (op '1+)
;;         (indices nil))
;;     (dolist (_ (number-sequence 0 (1- nchar)))
;;       (push irail indices)
;;       (setq irail (apply op (list irail)))
;;       (when (= (1+ irail) nrail)
;;         (setq op '1-))
;;       (when (zerop irail)
;;         (setq op '1+))
;;       )
;;     (reverse indices)))

(defun rail-fence-cipher/make-rail-indices (nchar nrail)
  (let ((indices (make-list nrail '()))
        (irail 0)
        (op '1+))
    (when (< nrail 1)
      (error "need at least one rail to make indices"))
    (dolist (ichar (number-sequence 0 (1- nchar)))
      (push ichar (nth irail indices))
      (setq irail (apply op (list irail)))
      (when (= (1+ irail) nrail)
        (setq op '1-))
      (when (zerop irail)
        (setq op '1+)))
    (mapcar (lambda (l) (reverse l)) indices)))

(defun encode (message rails)
  "Encode a MESSAGE on a number of RAILS."
  (let* ((len (length message))
         (encoded (make-string len 0))
         (indices (mapcan #'identity (rail-fence-cipher/make-rail-indices len rails)))
         (plain-chars (string-to-list message)))
    (mapc
     (lambda (iorig) (setf (aref encoded iorig) (nth (nth iorig indices) plain-chars)))
     (number-sequence 0 (1- len)))
    encoded))

(defun decode (message rails)
  "Decode a MESSAGE from a number of RAILS."
  (let* ((len (length message))
         (decoded (make-string len 0))
         (indices (mapcan #'identity (rail-fence-cipher/make-rail-indices len rails)))
         (encoded-chars (string-to-list message)))
    (mapc
     (lambda (iorig) (setf (aref decoded (nth iorig indices)) (nth iorig encoded-chars)))
     (number-sequence 0 (1- len)))
    decoded))


(provide 'rail-fence-cipher)
;;; rail-fence-cipher.el ends here
