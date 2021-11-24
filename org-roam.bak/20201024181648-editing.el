(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

(defun sort-words (reverse beg end)
      "Sort words in region alphabetically, in REVERSE if negative.
    Prefixed with negative \\[universal-argument], sorts in reverse.

    The variable `sort-fold-case' determines whether alphabetic case
    affects the sort order.

    See `sort-regexp-fields'."
      (interactive "*P\nr")
      (sort-regexp-fields reverse "\\w+" "\\&" beg end))

(delete-selection-mode 1)

(use-package expand-region
     :straight t)
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(use-package multiple-cursors
  :straight t
  :hook (fundamental-mode php-mode)
  :bind
  (("C-S-c C-S-c" . mc/edit-lines)
   ("C->" . mc/mark-next-like-this)
   ("C-<" . mc/mark-previous-like-this)
   ("C-c C-<" . mc/mark-all-like-this)))

;;  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
;;  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
;;  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;;  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
