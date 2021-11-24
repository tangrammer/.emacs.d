(use-package company
   :straight t
  ;;  :bind (("<tab>" . company-indent-or-complete-common))
    :config (global-company-mode))
;; (global-set-key (kbd "TAB") #'company-indent-or-complete-common)

(use-package company-flx
  :straight t
  :after company
  :config (company-flx-mode +1))
