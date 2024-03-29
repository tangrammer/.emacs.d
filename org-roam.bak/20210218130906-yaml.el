(use-package yaml-mode
  :straight (yaml-mode
             :host github
             :type git
             :repo "yoshiki/yaml-mode"
             :branch "master")
  :init (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

  (add-hook 'yaml-mode-hook
            '(lambda ()
               (define-key yaml-mode-map "\C-m" 'newline-and-indent)))
  )
