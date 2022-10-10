;;; robot-name.el --- Robot Name (exercism)

;;; Commentary:
;;
;; Build a robot with a name like AA000, that can be reset
;; to a new name. Instructions are in README.md
;;

;; A-Z is 65-90
;; digits are 0-9

;; 26 letters in the alphabet, (random LIMIT) is over the range [0, LIMIT), so
;; do (random 26) and add 65

(require 'eieio)
(require 'subr-x)

(defclass rn/robot ()
  ((name :initarg :name
         :type string
         :documentation "The universally unique name of the robot."))
  "A class for describing a robot.")

;; https://www.reddit.com/r/emacs/comments/7fnfju/how_to_customize_constructors_for_eieio_objects/
(cl-defmethod initialize-instance :after ((obj rn/robot) &rest _)
  (oset obj name (rn/make-name)))

(defun rn/random-letter-as-char ()
  "Return a random uppercase letter in character form."
  (+ (random 26) 65))

(defun rn/random-digit-as-char ()
  "Return a random digit in character form."
  (+ (random 10) 48))

(defun rn/make-name ()
  (string-join
   (mapcar #'char-to-string
           (list (rn/random-letter-as-char)
                 (rn/random-letter-as-char)
                 (rn/random-digit-as-char)
                 (rn/random-digit-as-char)
                 (rn/random-digit-as-char)))))

(defun build-robot ()
  "Build a new robot with a random name."
  (rn/robot))

(defun robot-name (robot)
  "Get the ROBOT's name."
  (slot-value robot :name))

(defun reset-robot (robot)
  "Reset the name of ROBOT.  Factory reset!"
  (setf (slot-value robot :name) (rn/make-name)))

(provide 'robot-name)
;;; robot-name.el ends here
