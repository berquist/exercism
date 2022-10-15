(ns bob
  (:require [clojure.string :as s]))

(def question-mark \?)

(defn is-silence [prompt]
  (empty? (s/trim prompt)))

(defn is-question [prompt]
  (= (last (s/trim prompt)) question-mark))

(defn is-yelling [prompt]
  (and (= prompt (s/upper-case prompt))
       (re-find #"[a-zA-Z]" prompt)))

(defn is-yelling-question [prompt]
  (and (is-yelling prompt) (is-question prompt)))

(defn response-for [prompt]
  (cond
    (is-silence prompt) "Fine. Be that way!"
    (is-yelling-question prompt) "Calm down, I know what I'm doing!"
    (is-question prompt) "Sure."
    (is-yelling prompt) "Whoa, chill out!"
    :else "Whatever."))
