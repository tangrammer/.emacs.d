(defun my-table-to-lisp ()
  "This makes a list of (table_name (rest...of...properties))"
  (let ((t-name (t/org/element/name-at-point)))
    (if t-name
        (list (cons t-name (list (org-table-to-lisp)))))))

(defun t/org/all-tables-to-lisp ()
  "example output table-1  (((col1 col2) hline (va1 val2) (val3 val4)))
   pay attention in how line is called hline"
  (let ((all-tables nil))
    (org-table-map-tables
     (lambda () (setq all-tables (append all-tables (my-table-to-lisp)))))
    all-tables))

(defun t/org/insert-all-tables-to-list()
  (interactive)
  ;;(org-babel-src-block-names)
  (insert (format "|all-tables:| |\n|---|\n"  ))
  (--map (insert (format "|%s| %s|\n" (car it) (cdr it))) (t/org/all-tables-to-lisp))
  (insert "|-–|\n")
  (insert (format "|block-names:| %s|\n" (org-babel-src-block-names)) )
  (insert "|-–|\n")
  (insert (format "|result-names:| %s|\n" (org-babel-result-names)) )
  (insert "|-–|\n"))

(defun read-org-result-by-name (name)
  (interactive "sBuffer to rename:")
  (eval (read (format "(org-sbe %s)" name))))
