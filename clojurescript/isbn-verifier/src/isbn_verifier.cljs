(ns isbn-verifier
  (:require [clojure.string :as str]))

(defn- parse-number [s]
  (let [parsed (js/parseInt s)
        isnan (js/isNaN parsed)]
    (if-not isnan
      parsed
      false)))

(comment (defn- parse-check-val [s]
   (let [parsed (js/parseInt s)
         isnan (js/isNaN parsed)]
     (cond
       (= s "X") 10
       (and (not (< -1 parsed 10))
            (not isnan)) false
       (not isnan) parsed
       :else false))))

(defn- parse-check-val [s]
  (let [parsed (parse-number s)]
    (cond
      (= s "X") 10
      (and (number? parsed)
           (not (< -1 parsed 10))) false
      :else parsed)))

(defn isbn? [isbn]
  (let [stripped (str/join (str/split isbn "-"))]
    (if (not (= (count stripped) 10))
      false
      (let [front-nine (subs stripped 0 9)
            check-val (parse-check-val (nth stripped 9))]
        (if (not (and check-val (number? (parse-number front-nine))))
          false
          (let [values (conj (into [] (map js/parseInt front-nine)) check-val)]
            (zero? (mod (reduce + (map * values (range 10 0 -1))) 11))))))))
