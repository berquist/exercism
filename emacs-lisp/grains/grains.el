;;; grains.el --- Grains exercise (exercism)

;;; Commentary:

;;; Code:

(defun square (square-num)
  (let ((tot 1))
    (dotimes (i (1- square-num))
      (setq tot (* tot 2)))
    tot))

(defun total ()
  ;; (apply '+ (mapcar 'square (number-sequence 1 64)))
  (1- (square (1+ 64))))

(provide 'grains)
;;; grains.el ends here
