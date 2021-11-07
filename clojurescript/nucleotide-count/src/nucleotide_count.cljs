(ns nucleotide-count)

(def valid-nucleotides #{\A \C \G \T})

(defn count-of-nucleotide-in-strand [nucleotide dna-strand]
  (if (valid-nucleotides nucleotide)
    (count (filter #(= % nucleotide) dna-strand))
    (throw (js/Error "invalid base"))))

(defn nucleotide-counts [dna-strand]
  (zipmap valid-nucleotides
          (map #(count-of-nucleotide-in-strand % dna-strand) valid-nucleotides)))
