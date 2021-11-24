(use-package dumb-jump
       :straight t
;;       :hook (js2-mode js-mode)
       )

(use-package smart-jump
  :straight t
  :hook (php-mode)
  :bind (("M-." . smart-jump-go)
         ("M-," . smart-jump-back)
         ("M-?" . smart-jump-references)))
