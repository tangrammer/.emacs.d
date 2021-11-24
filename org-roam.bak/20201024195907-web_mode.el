(use-package web-mode
  :straight t
  :config
  (add-to-list 'auto-mode-alist '("\\.js$" . hs-minor-mode))
  (add-to-list 'auto-mode-alist '("\\.js$" . prettier-js-mode))
  (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
  (add-to-list 'auto-mode-alist '("\\.json$" . hs-minor-mode))
  (add-to-list 'auto-mode-alist '("\\.handlebars$" . web-mode))
  )

;;(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

;; use web-mode for .jsx files
