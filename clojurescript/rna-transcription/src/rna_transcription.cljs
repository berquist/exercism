(ns rna-transcription
  (:require [clojure.string :as s]))

(defn to-rna [dna]
  (s/join
   (map #(case %
           "C" "G"
           "G" "C"
           "A" "U"
           "T" "A"
           (throw (js/Error "invalid base")))
        dna)))
