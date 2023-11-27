(defpackage :log-levels
  (:use :cl)
  (:export :log-message :log-severity :log-format))

(in-package :log-levels)

(defun log-message (log-string)
  (subseq log-string 8 (length log-string)))

(defun log-severity (log-string)
  (let ((level (string-downcase (subseq log-string 1 5))))
    (cond
      ((string= level "info") :everything-ok)
      ((string= level "warn") :getting-worried)
      ((string= level "ohno") :run-for-cover)
      (t (error "unrecognized log level")))))

(defun log-format (log-string)
  (let ((message (log-message log-string))
        (severity (log-severity log-string)))
    (cond
      ((eq severity :everything-ok) (string-downcase message))
      ((eq severity :getting-worried) (string-capitalize message))
      ((eq severity :run-for-cover) (string-upcase message))
      (t (error "malformed log string (unknown severity")))))
