;;; rna-transcription.el -- RNA Transcription (exercism)

;;; Commentary:



;;; Code:

(defun to-rna (dna)
  (mapconcat #'identity
   (mapcar
    (lambda (c) (char-to-string c))
    (mapcar
     (lambda (dna-base)
       (cond
        ((= dna-base ?C) ?G)
        ((= dna-base ?G) ?C)
        ((= dna-base ?A) ?U)
        ((= dna-base ?T) ?A)
        (t (error "invalid DNA base"))))
     (string-to-list dna)))
   nil))


(provide 'rna-transcription)
;;; rna-transcription.el ends here
