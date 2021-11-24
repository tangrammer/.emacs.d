(ns baba)
(require '[com.stuartsierra.dependency :as dep])
(first (map #(.getName %) (.listFiles (java.io.File. "."))))
