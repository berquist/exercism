(ns armstrong-numbers)

(defn get-digits
  "Extract the individual digits of an integer into a list of integers."
  [n]
  (loop [digits '()
         remaining n]
    (if (< remaining 10)
      (conj digits remaining)
      (recur (conj digits (rem remaining 10))
             (quot remaining 10)))))

(defn get-digits-old
  "Extract the individual digits of an integer into a list of integers."
  ;; https://batsov.com/articles/2022/08/01/clojure-tricks-number-to-digits/
  ;; TODO Rewrite with Clojure-style recursion
  [n]
  (if (< n 10)
    [n]
    (conj (get-digits-old (quot n 10)) (rem n 10))))

(defn armstrong?
  "Is the given number an Armstrong number?"
  [num]
  (let [digits (get-digits num)]
    (= num
       (reduce + (map #(js/Math.pow % (count digits)) digits)))))
