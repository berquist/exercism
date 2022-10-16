(ns anagram
  (:require [clojure.string :as str]))

(defn- sort-string
  "Sort the characters in a string, returning a string."
  [string]
  (str/join (sort string)))

(defn- is-anagram [word candidate]
  (let [down-word (str/lower-case word)
        down-candidate (str/lower-case candidate)]
    (and (not (= down-word down-candidate))
         (= (sort-string down-word)
            (sort-string down-candidate)))))

(defn anagrams-for [word prospect-list]
  (filter #(is-anagram word %) prospect-list))
