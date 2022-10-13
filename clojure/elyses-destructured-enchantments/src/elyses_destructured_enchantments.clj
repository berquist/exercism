(ns elyses-destructured-enchantments)

(defn first-card
  "Returns the first card from deck."
  [deck]
  (first deck))

(defn second-card
  "Returns the second card from deck."
  [deck]
  (second deck))

(defn swap-top-two-cards
  "Returns the deck with first two items reversed."
  [deck]
  (cons (second deck) (cons (first deck) (nthrest deck 2))))

(defn discard-top-card
  "Returns a sequence containing the first card and
   a sequence of the remaining cards in the deck."
  [deck]
  (if (zero? (count (rest deck)))
    [(first deck) nil]
    (cons (first deck) (list (rest deck)))))

(def face-cards
  ["jack" "queen" "king"])

(defn insert-face-cards
  "Returns the deck with face cards between its head and tail."
  [deck]
  (if-not (first deck)
    face-cards
    (concat (list (first deck)) face-cards (rest deck))))
