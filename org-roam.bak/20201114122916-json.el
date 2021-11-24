(use-package json-mode
    :straight t
    )
(add-to-list 'auto-mode-alist '("\\.json" . json-mode))
(add-hook 'json-mode-hook 'hs-minor-mode)
