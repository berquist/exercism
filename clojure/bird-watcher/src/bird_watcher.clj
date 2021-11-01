(ns bird-watcher)

(def last-week 
  [0 2 5 3 7 8 4])

(defn today [birds]
  (last birds))

(defn inc-bird [birds]
  (assoc birds (- (count birds) 1) (+ (last birds) 1)))

(defn day-without-birds? [birds]
  (not (nil? (some #{0} birds))))

(defn n-days-count [birds n]
  (apply + (take n birds)))

(def busy-day 5)

(defn busy-days [birds]
  (count (filter #(>= % busy-day) birds)))

(defn odd-week? [birds]
  (= birds [1 0 1 0 1 0 1]))
