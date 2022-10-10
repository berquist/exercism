;;; allergies.el --- Allergies Exercise (exercism)

;;; Commentary:

(require 'cl-extra)
(require 'cl-seq)

(defconst allergen-to-score
  (nreverse '(("eggs" . 1)
              ("peanuts" . 2)
              ("shellfish" . 4)
              ("strawberries" . 8)
              ("tomatoes" . 16)
              ("chocolate" . 32)
              ("pollen" . 64)
              ("cats" . 128))))

(defun remove-excess-powers-of-base (total max base)
  "Remove all components of TOTAL corresponding to powers of BASE larger than MAX."
  (if (> total 0)
      ;; First, make sure that MAX as an integer power of BASE, otherwise the
      ;; operation is undefined.
      (let* ((max-pow-and-fractional (cl-floor (log max base)))
             (max-fractional (cadr max-pow-and-fractional)))
        (when (zerop max-fractional)
          (let* ((total-pow (floor (log total base)))
                 (max-pow (car max-pow-and-fractional))
                 (pows (number-sequence (1+ max-pow) total-pow))
                 (exps (mapcar #'(lambda (pow) (expt base pow)) pows))
                 (excess (cl-reduce #'+ exps)))
            (- total excess))))
    total))

(defun allergen-list (score)
  "List all allergens with a given SCORE."
  (let ((allergens '())
        (remaining-score (remove-excess-powers-of-base score (cdar allergen-to-score) 2)))
    (dolist (allergen-and-score allergen-to-score)
      (let ((allergen-name (car allergen-and-score))
            (allergen-score (cdr allergen-and-score)))
        (when (<= allergen-score remaining-score)
          (push allergen-name allergens)
          (setq remaining-score (- remaining-score allergen-score)))))
    allergens))

(defun allergic-to-p (score allergen)
  "Check if Allergic to allergen based on SCORE and ALLERGEN."
  (seq-contains-p (allergen-list score) allergen))

(provide 'allergies)
;;; allergies.el ends here
