

(use-package origami
  :straight (origami :type git :host github :repo "gregsexton/origami.el")
  :bind (("M-+" . origami-open-node)
         ("M--" . origami-close-node)
         ("M-Ç" . origami-recursively-toggle-node)
         ("M-*" . origami-open-all-nodes)))
