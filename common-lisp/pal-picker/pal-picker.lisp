(defpackage :pal-picker
  (:use :cl)
  (:export :pal-picker :habitat-fitter :feeding-time-p
           :pet :play-fetch))

(in-package :pal-picker)

(defun pal-picker (personality)
  (cond
    ((eq personality :lazy) "Cat")
    ((eq personality :energetic) "Dog")
    ((eq personality :quiet) "Fish")
    ((eq personality :hungry) "Rabbit")
    ((eq personality :talkative) "Bird")
    (t "I don't know... A dragon?")))

(defun habitat-fitter (weight)
  (cond
    ((>= weight 40) :massive)
    ((>= weight 20) :large)
    ((>= weight 10) :medium)
    ((>= weight 1) :small)
    (t :just-your-imagination)))

(defun feeding-time-p (fullness)
  (if (<= fullness 20)
      "It's feeding time!"
      "All is well."))

(defun pet (pet)
  (string= pet "Fish"))

(defun play-fetch (pet)
  (not (string= pet "Dog")))
