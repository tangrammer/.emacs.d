;; (eval-after-load "org"
;;  '(require 'ox-gfm nil t))

(use-package markdown-mode
  :straight t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))
