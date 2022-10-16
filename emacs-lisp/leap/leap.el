;;; leap.el --- Leap exercise (exercism)

;;; Commentary:

;;; Code:

(defun leap-year-p (year)
  (and (zerop (mod year 4))
       (or (not (zerop (mod year 100)))
           (and (zerop (mod year 100))
                (zerop (mod year 400))))))

(provide 'leap-year-p)
;;; leap.el ends here
