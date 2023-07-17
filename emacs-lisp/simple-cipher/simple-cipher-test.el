;;; simple-cipher-test.el --- Simple Cipher (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "simple-cipher.el")
(declare-function sc--get-real-key-index "simple-cipher.el" (key index))
(declare-function sc--make-shift "simple-cipher.el" (chars-key i))
(declare-function sc--make-forward-shifted-char "simple-cipher.el" (char-pt shift))
(declare-function sc--make-backward-shifted-char "simple-cipher.el" (char-ct shift))
(declare-function encode "simple-cipher.el" (plaintext key))
(declare-function decode "simple-cipher.el" (ciphertext key))
(declare-function generate-key "simple-cipher.el" ())


(ert-deftest get-real-key-index-wrap0 ()
  "With a length of 4, zero-based index 2 doesn't wrap."
  (should (= 2 (sc--get-real-key-index "abcd" 2))))


(ert-deftest get-real-key-index-wrap1 ()
  "With a length of 4, zero-based index 5 wraps to 1."
  (should (= 1 (sc--get-real-key-index "abcd" 5))))


(ert-deftest get-real-key-index-wrap2 ()
  "With a length of 4, zero-based index 6 wraps to 2."
  (should (= 2 (sc--get-real-key-index "abcd" 6))))


(ert-deftest get-real-key-index-single1 ()
  "With a length of 1, zero-based index 0 wraps to 0."
  (should (= 0 (sc--get-real-key-index "z" 0))))


(ert-deftest get-real-key-index-single2 ()
  "With a length of 1, zero-based index 1 wraps to 0."
  (should (= 0 (sc--get-real-key-index "z" 1))))


(ert-deftest get-real-key-index-empty1 ()
  (should (= 0 (sc--get-real-key-index "" 0))))


(ert-deftest get-real-key-index-empty2 ()
  (should (= 1 (sc--get-real-key-index "" 1))))


(ert-deftest make-forward-shift ()
  ;; a to a is 0
  (should (= 0 (sc--make-shift (string-to-list "cba") 2)))
  ;; a to b is 1
  (should (= 1 (sc--make-shift (string-to-list "cba") 1)))
  ;; a to c is 2
  (should (= 2 (sc--make-shift (string-to-list "cba") 0)))
  ;; a to z is 25
  (should (= 25 (sc--make-shift (string-to-list "z") 0))))


(ert-deftest make-forward-shifted-char ()
  (should (=
           (string-to-char "y")
           (sc--make-forward-shifted-char (string-to-char "y") 0)))
  (should (=
           (string-to-char "z")
           (sc--make-forward-shifted-char (string-to-char "y") 1)))
  (should (=
           (string-to-char "a")
           (sc--make-forward-shifted-char (string-to-char "y") 2)))
  (should (=
           (string-to-char "b")
           (sc--make-forward-shifted-char (string-to-char "y") 3))))


(ert-deftest make-backward-shifted-char ()
  (should (=
           (string-to-char "y")
           (sc--make-backward-shifted-char (string-to-char "y") 0)))
  (should (=
           (string-to-char "x")
           (sc--make-backward-shifted-char (string-to-char "y") 1)))
  (should (=
           (string-to-char "y")
           (sc--make-backward-shifted-char (string-to-char "a") 2)))
  (should (=
           (string-to-char "y")
           (sc--make-backward-shifted-char (string-to-char "b") 3))))


(ert-deftest can-encode-random-key ()
  (let ((key (generate-key)))
    (should
     (string=
      (substring key 0 (length "aaaaaaaaaa"))
      (encode "aaaaaaaaaa" key)))))


(ert-deftest can-decode-random-key ()
  (let ((key (generate-key)))
    (should
     (string=
      "aaaaaaaaaa"
      (decode (substring key 0 (length "aaaaaaaaaa")) key)))))


(ert-deftest is-reversible-random-key ()
  (let* ((key (generate-key))
         (encoded (encode "abcdefghij" key)))
    (should (string= "abcdefghij" (decode encoded key)))))


(ert-deftest key-is-made-only-of-lowercase-letters ()
  (should (string-match "^[a-z]+$" (generate-key))))


(ert-deftest can-encode ()
  (should (string= "abcdefghij" (encode "aaaaaaaaaa" "abcdefghij"))))


(ert-deftest can-decode ()
  (should (string= "aaaaaaaaaa" (decode "abcdefghij" "abcdefghij"))))


(ert-deftest is-reversible ()
  (let ((encoded (encode "abcdefghij" "abcdefghij")))
    (should (string= "abcdefghij" (decode encoded "abcdefghij")))))


(ert-deftest can-double-shift-encode ()
  (should
   (string=
    "qayaeaagaciai" (encode "iamapandabear" "iamapandabear"))))


(ert-deftest can-wrap-on-encode ()
  (should (string= "zabcdefghi" (encode "zzzzzzzzzz" "abcdefghij"))))


(ert-deftest can-wrap-on-decode ()
  (should (string= "zzzzzzzzzz" (decode "zabcdefghi" "abcdefghij"))))


(ert-deftest can-encode-messages-longer-than-the-key ()
  (should (string= "iboaqcnecbfcr" (encode "iamapandabear" "abc"))))


(ert-deftest can-decode-messages-longer-than-the-key ()
  (should (string= "iamapandabear" (decode "iboaqcnecbfcr" "abc"))))


(provide 'simple-cipher-test)
;;; simple-cipher-test.el ends here
