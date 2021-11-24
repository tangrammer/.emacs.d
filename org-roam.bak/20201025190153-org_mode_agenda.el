(org-agenda-files)

(defun agenda-todos nil
  (interactive)
  (org-agenda t "t"))

(define-transient-command t/agenda ()
        "agenda related things"
        ["Actions"
         ("t" "todos" agenda-todos)
         ("l" "agenda files" (lambda () (interactive) (message "%s" org-agenda-files)))
         ("a" "Add file to agenda files" org-agenda-file-to-front)
         ("r" "remove file to agenda files" org-remove-file)])
