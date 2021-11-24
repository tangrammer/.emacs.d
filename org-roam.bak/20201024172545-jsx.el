(use-package rjsx-mode
  :straight t
;;  :hook (dumb-jump-mode)
  :config
  (add-to-list 'auto-mode-alist '("\\.jsx$" . rjsx-mode))
)
