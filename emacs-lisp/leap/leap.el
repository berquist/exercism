;;; leap.el --- Leap exercise (exercism)

;;; Commentary:

;;; Code:

(defun leap-year-p (year)
  (and (= (mod year 4) 0)
       (or (not (= (mod year 100) 0))
           (and (= (mod year 100) 0)
                (= (mod year 400) 0)))))

(provide 'leap-year-p)
;;; leap.el ends here
