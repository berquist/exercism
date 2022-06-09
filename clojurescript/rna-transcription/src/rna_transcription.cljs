(ns rna-transcription
  (:require [clojure.string :as s]))

(defn to-rna [dna]
  (s/join
   (map
    (fn [dna-base]
      (cond
        (= dna-base "C") "G"
        (= dna-base "G") "C"
        (= dna-base "A") "U"
        (= dna-base "T") "A"
        :else (throw (js/Error "invalid base"))))
    dna)))
