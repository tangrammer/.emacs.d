(setq org-default-notes-file "~/git/orgs/gtd/notes.org")

(setq org-capture-templates '(("t" "Todo" entry (file+headline org-default-notes-file "Tasks")
         "* TODO %?\n  %i\n  %a")))

(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-c\C-d" 'org-deadline)

(defun idea nil 
  (interactive) 
  (org-capture t "t"))
