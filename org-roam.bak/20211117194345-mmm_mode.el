(use-package mmm-mode
  :straight (mmm-mode :type git :host github :repo "purcell/mmm-mode")

)

(require 'mmm-mode)
(setq mmm-global-mode nil)
(mmm-add-mode-ext-class 'org-mode nil 'org-python)
(mmm-add-mode-ext-class 'org-mode nil 'org-elisp)

(mmm-add-group
 'org-python
 '((python-src-block
    :submode python-mode
    :face org-block
    :front "#\\+BEGIN_SRC python.*\n"
    :back "#\\+END_SRC")))

(mmm-add-group
 'org-elisp
 '((elisp-src-block
    :submode emacs-lisp-mode
    :face org-block
    :front "#\\+BEGIN_SRC emacs-lisp.*\n"
    :back "#\\+END_SRC")))

(require 'dash)
 (-first-item '("hola"))
