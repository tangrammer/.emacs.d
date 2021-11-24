(defun yank-ring-pop ()
  "If there is a recent yank act like `yank-pop'.
Otherwise choose text from the kill ring and insert it."
  (interactive)
  (if (eq last-command 'yank) (yank-pop) (call-interactively 'yank-ring-insert)))

(defun yank-ring-read ()
  "Open kill ring menu and return chosen text."
  (completing-read "Ring: "
                   (cl-remove-duplicates kill-ring :test #'equal :from-end t)
                   nil ':require-match))

;; Replace just-yanked text with chosen text.
;; Adapted from the Emacs yank-pop function.
(defun yank-ring-replace (text)
  "Choose TEXT from the kill ring.
If there was no recent yank, insert the text.
Otherwise replace the just-yanked text with the chosen text."
  (interactive (list (yank-ring-read)))
  (if (not (eq last-command 'yank)) (yank-ring-insert text)
      (let ((inhibit-read-only t)
      (before (< (point) (mark t))))
        (setq this-command 'yank)
        (if before
      (funcall (or yank-undo-function 'delete-region) (point) (mark t))
          (funcall (or yank-undo-function 'delete-region) (mark t) (point)))
        (setq yank-undo-function nil)
        (set-marker (mark-marker) (point) (current-buffer))
        (insert-for-yank text)
        (set-window-start (selected-window) yank-window-start t)
        (if before
      (goto-char (prog1 (mark t)
             (set-marker (mark-marker) (point) (current-buffer)))))))
  nil)

;; Insert chosen text.
;; Adapted from the Emacs yank function.
(defun yank-ring-insert (text)
  "Choose TEXT from the kill ring and insert it."
  (interactive (list (yank-ring-read)))
  (setq yank-window-start (window-start))
  (push-mark)
  (insert-for-yank text)
  (setq this-command 'yank)
  nil)

;; (defhydra hydra-yank ()
;;   "yank"
;;   ("C-y" yank nil)
;;   ("y" yank-ring-pop "yank")
;;   ("r" yank-ring-replace "ring" :color blue)
;;   ("q" nil "quit"))
