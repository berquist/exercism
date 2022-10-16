(ns triangle)

(defn equality-one?
  [sides]
  (every? #(> % 0.0) sides))

(defn permutations
  "https://stackoverflow.com/a/26076537"
  [seq]
  (if (= 1 (count seq))
    (list seq)
    (for [head seq
          tail (permutations (disj (set seq) head))]
      (cons head tail))))

(defn equality-two?
  [sides]
  (every? #(>= (+ (nth sides (nth % 0))
                  (nth sides (nth % 1)))
               (nth sides (nth % 2)))
          (permutations (range 3))))

(defn equilateral?
  [s1 s2 s3]
  (let [sides (list s1 s2 s3)]
    (and (= (count (set sides)) 1)
         (equality-one? sides))))

(defn isosceles?
  [s1 s2 s3]
  (let [sides (list s1 s2 s3)]
    (and (<= (count (set sides)) 2)
         (equality-one? sides)
         (equality-two? sides))))

(defn scalene?
  [s1 s2 s3]
  (let [sides (list s1 s2 s3)]
    (and (= (count (set sides)) 3)
         (equality-one? sides)
         (equality-two? sides))))
