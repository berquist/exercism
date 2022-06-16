(ns rna-transcription
  (:require [clojure.string :as s]))

(defn to-rna [dna]
  (s/join
   (map
    (fn [dna-base]
      (case dna-base
        "C" "G"
        "G" "C"
        "A" "U"
        "T" "A"
        (throw (js/Error "invalid base"))))
    dna)))
