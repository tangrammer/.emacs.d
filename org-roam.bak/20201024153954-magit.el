(use-package magit
    :straight nil
    :config
    (global-set-key (kbd "C-x g") 'magit-status)
    )

;; (add-hook 'magit-mode-hook #'magit-todos-mode)

(defun co-authored-insert-text (choice)
  (let ((author
         (cond ((string= choice "daniel") "Daniel Sunnerek <daniel@akvo.org>")
               ((string= choice "ivan") "Iván Perdomo <ivan@perdomo.me>")
               ((string= choice "emmanuel") "Emmanuel Mulo <emmanuel@akvo.org>")
               ((string= choice "valeria") "Valeria Rogatchevskikh <valeria@akvo.org>")
               ((string= choice "juan") "Juan A. Ruz <juanantonioruz@gmail.com>"))))
    (insert (format "Co-authored-by: %s" author "\n"))))

(defvar authors '("daniel" "ivan" "emmanuel" "valeria" "marvin" "juan"))

(defun my-read-tags ()
  (let (tags tag done)
    (while (not done)
      (setq tag (completing-read "Choose: " (cons " " (-difference authors tags)) nil t))
      (if (string= tag " ")
          (setq done t)
        (push tag tags)))
    (nreverse tags)))

(defun co-authored-multiple (tags)
  (interactive (list (my-read-tags)))
  (--map (co-authored-insert-text it) tags))

(defun co-authored (choice)
  (interactive
   (let ((completion-ignore-case  t))
     (list (completing-read "Choose: " authors nil t))))
  (co-authored-insert-text choice))

(defun co-co (authors)
  (interactive "sauthors separated by comma: ")
  (insert (shell-command-to-string (format "~/.emacs.d/bashs/co-authored-by %s" authors)))
  )
