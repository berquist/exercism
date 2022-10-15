(ns rna-transcription
  (:require [clojure.string :as s]))

(defn- error [msg]
  (js/Error msg))

(defn- ctos
  "Convert a character to a string."
  [cs]
  cs)

(defn to-rna [dna]
  (->> dna
       (map ctos)
       (map #(case %
               "C" "G"
               "G" "C"
               "A" "U"
               "T" "A"
               (throw (error "invalid base"))))
       s/join))
