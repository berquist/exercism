(ns run-length-encoding
  (:require [clojure.string :as string]))

;; adapted from https://rosettacode.org/wiki/Run-length_encoding#Clojure
(defn run-length-encode
  [plain-text]
  (->> plain-text
       (partition-by identity)
       (mapcat (juxt count first))
       (filter #(not= % 1))
       (apply str)))

(defn run-length-decode-acc
  [acc digits ch remaining]
  (cond
    (nil? ch) (string/join acc)
    (Character/isDigit ch) (run-length-decode-acc
                            acc
                            (conj digits ch)
                            (first remaining)
                            (rest remaining))
    :else (run-length-decode-acc
           (conj acc (string/join (repeat (if (empty? digits) 1 (Integer/parseInt (string/join (map str digits)))) ch)))
           []
           (first remaining)
           (rest remaining))))

(defn run-length-decode
  [cipher-text]
  (if (empty? cipher-text)
    ""
;; (loop [acc []
;;          digits []
;;          ch (first cipher-text)
;;          remaining (rest cipher-text)]
;;     (if (nil? ch)
;;       acc
;;       (if (Character/isDigit ch)
;;             (recur
;;              acc
;;              (conj digits ch)
;;              (first remaining)
;;              (rest remaining))
;;             (recur
;;              (conj acc (string/join (repeat (Integer/parseInt (string/join (map str digits))) ch)))
;;              []
;;              (first remaining)
;;              (rest remaining)))

    ;;       ))
    (run-length-decode-acc [] [] (first cipher-text) (rest cipher-text))
)
  
)
