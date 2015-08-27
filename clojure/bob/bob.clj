(ns bob)

(defn response-for [phrase]
  (let [upper? (= phrase (clojure.string/upper-case phrase))]
    (if (and (re-find #"(\d*)?\?$" phrase)
             (or (not upper?)
                 (clojure.string/blank? (clojure.string/replace phrase #"\d*\?" ""))))
      "Sure."
      (if (clojure.string/blank? phrase)
        "Fine. Be that way!"
        (if (and upper?
                 (not (clojure.string/blank?
                        (clojure.string/replace phrase #"\d*\W?" ""))))
          "Whoa, chill out!"
          "Whatever.")))))
