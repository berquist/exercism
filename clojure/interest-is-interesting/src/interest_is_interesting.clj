(ns interest-is-interesting)

(defn interest-rate
  "Return the interest rate based on current balance."
  [balance]
  (cond
    (< balance 0) -3.213
    (< balance 1000) 0.5
    (< balance 5000) 1.621
    :else 2.475))

(defn annual-balance-update
  "Return an updated balance after applying the interest rate."
  [balance]
  (def rate (/ (bigdec (interest-rate balance)) 100))
  (if (neg? rate)
    (* balance (- 1 rate))
    (* balance (+ 1 rate))))

;; Whoever wrote this particular part of the problem did a terrible job.
;; Taken from
;; https://exercism.org/tracks/clojure/exercises/interest-is-interesting/solutions/aQua
;; because the prompt gives nowhere near enough information to implement this.

(defn amount-to-donate
  "TODO: add docstring"
  [balance tax-free-percentage]
  (max 0 (int (* balance tax-free-percentage 0.02M))))
