
(defun repeatt nil 
  (interactive) 
  (call-interactively (quote libmpdel-playback-next)))


(defun linux-help nil 
  (interactive) 
  (call-interactively (quote man)))

(defun unfocus-point nil 
  (interactive) 
  (call-interactively (quote widen)))

(defun org-link nil 
  (interactive) 
  (call-interactively (quote org-store-link)))

(defun focus-point nil 
  (interactive) 
  (call-interactively (quote org-narrow-to-subtree)))

(defun agenda-visita-all-files-cycle nil 
  (interactive) 
  (call-interactively (quote org-cycle-agenda-files)))

(defun agenda-dont-track-file nil 
  (interactive) 
  (call-interactively (quote org-remove-file)))

(defun add-agenda-file nil 
  (interactive) 
  (call-interactively (quote org-agenda-file-to-front)))

(defun todo nil 
  (interactive) 
  (call-interactively (quote org-todo-list)))
