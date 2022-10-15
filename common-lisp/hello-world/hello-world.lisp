(defpackage :hello-world
  (:use :cl)
  (:export :hello-world))

(in-package :hello-world)

(defun hello-world ()
  "Hello, World!")
