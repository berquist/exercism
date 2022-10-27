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

(defn- parse-int
  "Parse an integer or character digit from a string."
  [s]
  (let [parsed (js/parseInt s)
        isnan (js/isNaN parsed)]
    (if-not isnan
      parsed
      false)))

(defn- is-int [x]
  (parse-int x))

(defn- form-count [digits]
  (if (empty? digits) 1 (parse-int (string/join (map str digits)))))

(defn run-length-decode
  [cipher-text]
  (loop [acc []
         digits []
         ch (first cipher-text)
         remaining (rest cipher-text)]
    (cond
    (nil? ch) (string/join acc)
    (is-int ch) (recur
                 acc
                 (conj digits ch)
                 (first remaining)
                 (rest remaining))
    :else (recur
           (conj acc (string/join (repeat (form-count digits) ch)))
           []
           (first remaining)
           (rest remaining)))))
