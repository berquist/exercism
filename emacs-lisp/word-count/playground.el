(setq foo '())
(setf (alist-get 'a foo) 2)
(setf (alist-get 'b foo) 10)
(setf (alist-get 'a foo) 5)
(print foo)

(let ((bar '()))
  (setf (alist-get 'a bar) 4)
  (setf (alist-get 'b bar) 20)
  (setf (alist-get 'a bar) 10)
  (setf (alist-get 'a bar) 11)
  (setf (alist-get 'b bar) 42)
  (setf (alist-get 'a bar) (1+ (alist-get 'a bar)))
  (print bar))

(defun increment-count (key counts)
  (let ((count (alist-get key counts)))
    (print count)))

(increment-count 'a foo)
(increment-count 'b foo)
(increment-count 'c foo)

(defun increment-count-2 (key counts)
  (let ((count (alist-get key counts)))
    (if count
        (print "hello")
      (print "nope"))))

(increment-count-2 'a foo)
(increment-count-2 'b foo)
(increment-count-2 'c foo)

(defun increment-count-3 (key counts)
  (let ((count (alist-get key counts)))
    (progn
      (princ (format "[before] key: %s count: %s\n" key count))
      (if count
          (setf (alist-get key counts) (1+ count))
        (setf (alist-get key counts) 1)
        )
      (princ (format "[after] key: %s count: %s\n" key (alist-get key counts)))
      )
    )
  )

(increment-count-3 'a foo)
(increment-count-3 'b foo)
(increment-count-3 'c foo)
(increment-count-3 'b foo)
(increment-count-3 'a foo)
(print foo)

(defun increment-count-4 (keys counts)
  (dolist (key keys)
   (let ((count (alist-get key counts)))
     (progn
       (princ (format "[before] key: %s count: %s\n" key count))
       (if count
           (setf (alist-get key counts) (1+ count))
         (setf (alist-get key counts) 1)
         )
       (princ (format "[after] key: %s count: %s\n" key (alist-get key counts)))
       )
     ))
  )

(increment-count-4 '(d e f) foo)
(print foo)

(require 'a)
(setq bar '())
(setq bar (a-assoc bar 'a 21))
(setq bar (a-assoc bar 'b 22))
(setq bar (a-update bar 'b '1+))
(setq bar (a-assoc bar 'a 50))
(print bar)

(defun increment-count-5 ()
  (let ((counts '((a . 2))))
    (progn
      (dolist (key '(a b c a b a))
        (princ (format "%s: %s\n" key (alist-get key counts)))
        (if (alist-get key counts)
            (setf (alist-get key counts) (1+ (alist-get key counts)))
          (setf (alist-get key counts) 1)))
      (print counts))))

(increment-count-5)
