(defun transient-args-to-plist (args)
  (->> args
   (--reduce-from (let ((res (split-string it "=")))
                    (plist-put acc (intern (-first-item res)) (-last-item res))) '())))



(transient-args-to-plist '("hola=1" "adios=2"))

(defun bb (props query-type &optional query-id)
  (with-temp-buffer
    (shell-command (format "~/.emacs.d/bbs/bb-postgres.clj %s %s %s %s %s %s %s %s"
                           (plist-get props 'dbtype)
                           (plist-get props 'host)
                           (plist-get props 'dbname)
                           (plist-get props 'user)
                           (plist-get props 'password)
                           (plist-get props 'port)
                           query-type query-id)  (buffer-name))
    ;;(clipboard-kill-region (point-min) (point-max))
    (let ((res (message "%s" (buffer-string))))
      ;;(clipboard-kill-region (point-min) (point-max))
      res)))

;;
;; https://stackoverflow.com/questions/8145008/how-to-parse-a-string-as-a-list-structure
(comment
 (car (read-from-string (bb "tables")))
 (car (read-from-string (bb "views")))
 (car (read-from-string (bb "columns" "country")))
 (car (read-from-string (bb "enums" ))) )

(defun bb-columns-table (choice)
  "..."
  (interactive
   (let ((completion-ignore-case  t))
     (list (completing-read "Choose: " (car (read-from-string (bb (transient-args-to-plist (transient-args 't/postgres/meta)) "tables"))) nil t))))
  (message "Table '%s', columns:  %s " choice (bb (transient-args-to-plist (transient-args 't/postgres/meta)) "columns" choice)))

(defun bb-columns-view (choice)
  "..."
  (interactive
   (let ((completion-ignore-case  t))
     (list (completing-read "Choose: " (car (read-from-string (bb (transient-args-to-plist (transient-args 't/postgres/meta)) "views"))) nil t))))
  (message "Table '%s', columns:  %s " choice (bb (transient-args-to-plist (transient-args 't/postgres/meta)) "columns" choice)))

(defun bb-enums-view (choice)
  "..."
  (interactive
   (let ((completion-ignore-case  t))
     (list (completing-read "Choose: " (car (read-from-string (bb (transient-args-to-plist (transient-args 't/postgres/meta)) "enums"))) nil t))))
  ;;(message "%s" (plist-get (transient-args-to-plist (transient-args 't/postgres/meta)) 'port))
  (message "ENUM '%s', values:  %s " choice (bb (transient-args-to-plist (transient-args 't/postgres/meta)) "enums-values" choice)))



(transient-define-argument t/sql/dbtype ()
    "language"
    :description "choose a dbtype"
    :class 'transient-option
    :shortarg "-l"
    :argument "dbtype="
    :choices '("postgresql"  ))
(transient-define-argument t/sql/host ()
    "host"
    :description "choose a host"
    :class 'transient-option
    :shortarg "-h"
    :argument "host="
    )
(transient-define-argument t/sql/dbname ()
  "dbname"
    :description "choose a dbname"
    :class 'transient-option
    :argument "dbname="
    )
(transient-define-argument t/sql/dbuser ()
  "user"
    :description "choose a dbuser"
    :class 'transient-option
    :argument "user="
    )
(transient-define-argument t/sql/dbpassword ()
  "pass"
    :description "choose a pass"
    :class 'transient-option
    :argument "password="
    )
(transient-define-argument t/sql/dbport ()
  "port"
    :description "choose a pass"
    :class 'transient-option
    :argument "port="
    )

(define-transient-command t/postgres/meta ()
  "postgres meta related"
  :value `("dbtype=postgresql" "host=localhost" "port=5432")
  ["Arguments"
   ("d" "dbtype" t/sql/dbtype)
   ("h" "host" t/sql/host)
   ("b" "dbname" t/sql/dbname)
   ("u" "user" t/sql/dbuser)
   ("p" "password" t/sql/dbpassword)
   ("P" "port" t/sql/dbport)]
  ["Actions"
   ("v" "views" bb-columns-view)
   ("e" "enums" bb-enums-view)
   ("t" "tables" bb-columns-table)]

  )
