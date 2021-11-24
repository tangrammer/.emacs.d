(defun t/org/element/name-at-point ()
  (plist-get (cadr (org-element-at-point)) :name))
