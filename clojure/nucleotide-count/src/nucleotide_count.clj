(ns nucleotide-count)

(def valid-nucleotides #{\A \C \G \T})

(defn count-of-nucleotide-in-strand [nucleotide strand]
  (if (valid-nucleotides nucleotide)
    (count (filter #(= % nucleotide) strand))
    (throw (Exception. "invalid base"))))

(defn nucleotide-counts [strand]
  (zipmap valid-nucleotides
          (map #(count-of-nucleotide-in-strand % strand) valid-nucleotides)))
