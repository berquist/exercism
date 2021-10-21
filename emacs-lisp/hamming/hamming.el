;;; hamming.el --- Hamming (exercism)

;;; Commentary:

;;; Code:

(defun hamming-distance (s1 s2)
  (if (= (length s1) (length s2))
      (let ((l1 (string-to-list s1))
            (l2 (string-to-list s2))
            (ndiff 0))
        (dotimes (i (length s1))
          (when (not (= (nth i l1) (nth i l2)))
            (setq ndiff (1+ ndiff))))
        ndiff)
    (error "arguments to hamming-distance must have equal length")))

(provide 'hamming)
;;; hamming.el ends here
