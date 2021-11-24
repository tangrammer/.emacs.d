(use-package imenu-list

  :bind (("C-'" . imenu-list-smart-toggle))
  :straight t
  :config
  (setq imenu-list-focus-after-activation t
        imenu-list-auto-resize nil))
