(ns word-count
  (:require [clojure.string :as str]))

(defn word-count [s]
  (-> s
      (str/replace #"[^\w\d\s]" "")
      str/lower-case
      (str/split #"\s+")
      frequencies))
