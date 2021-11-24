(get-buffer "funs.el")

(defmacro alias (f-name var)
  ``(defun ,(make-symbol ,f-name) ()
      (interactive)
      (call-interactively ',,var)))

(comment
 (alias "tangrammer-ole" last-command)
 (make-symbol "s"))

(defun write-fun (s)
  (interactive "sFunction name:")
  (with-current-buffer "funs.el"
    (newline)
    (insert (to-string (alias s last-command)))
    (elisp-format-buffer)
    (save-buffer)
    )
  )
