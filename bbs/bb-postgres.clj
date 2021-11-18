#!/usr/bin/env bb
;; https://stackoverflow.com/questions/54415562/how-to-get-enum-in-postgresql-based-on-enum-type-using-conditional-statement
;; https://sadique.io/blog/2019/05/09/looking-up-enum-types-and-values-in-postgres/
(require '[babashka.pods :as pods])

;; load from pod registry:
(pods/load-pod 'org.babashka/postgresql "0.0.7")
;; or load from system path:
;; (pods/load-pod "pod-babashka-postgresql")
;; or load from a relative or absolute path:
;; (pods/load-pod "./pod-babashka-postgresql")

(require '[pod.babashka.postgresql :as pg]
         '[clojure.string :as str])

(def opts (let [[dbtype host dbname user password port
                 query-type query-id] *command-line-args*]
            {:dbtype (or dbtype "postgresql")
             :host (or host "localhost")
             :dbname dbname
             :user user
             :password password
             :port (or port 5432)
             :query-type query-type
             :query-id query-id}))

(def db opts)

(defn columns [db table]
  (let [res (pg/execute! db ["select table_schema,
       table_name,
       ordinal_position as position,
       column_name,
       data_type,
       case when character_maximum_length is not null
            then character_maximum_length
            else numeric_precision end as max_length,
       is_nullable,
       column_default as default_value
from information_schema.columns
where table_schema not in ('information_schema', 'pg_catalog')
and table_name=?
order by table_schema,
         table_name,
         ordinal_position;
" table])]
    (map :columns/column_name res)))

(defn tables [db & [table-type]]
  (map :tables/table_name (pg/execute! db ["SELECT table_name
  FROM information_schema.tables
 WHERE table_schema='public'
   AND table_type=?" (or table-type "BASE TABLE") ])))

(defn views [db]
  (tables db "VIEW"))

(defn enums [db & [enum-type]]
  (if enum-type
    (-> (pg/execute! db ["SELECT
  type.typname AS name,
  string_agg(enum.enumlabel, '|') AS value
FROM pg_enum AS enum
JOIN pg_type AS type
  ON (type.oid = enum.enumtypid)
where type.typname=?
GROUP BY type.typname" enum-type])
        first
        :value
        (str/split #"\|"))
    (->> (pg/execute! db ["SELECT
  type.typname AS name,
  string_agg(enum.enumlabel, '|') AS value
FROM pg_enum AS enum
JOIN pg_type AS type
  ON (type.oid = enum.enumtypid)
GROUP BY type.typname"])
         (map :pg_type/name))))

(comment


  (pg/execute! db ["SELECT distinct(tables.table_type)
  FROM information_schema.tables
 WHERE table_schema='public'
" ])
  [{:tables/table_type "VIEW"} {:tables/table_type "BASE TABLE"}]

  (columns db  "invitation")

  (first *command-line-args*)

  (columns db "currency")
  )
(when (or (:query-type opts) (:query-id opts))
  (condp = (:query-type opts)
    "tables" (tables db)
    "views"  (tables db "VIEW")
    "enums"  (enums db)
    "enums-values"  (enums db (:query-id opts))
    "columns" (columns db (:query-id opts))))
