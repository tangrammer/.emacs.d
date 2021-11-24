(require 'tramp)

(use-package docker-tramp
  :straight (docker-tramp :type git :host github :repo "emacs-pe/docker-tramp.el")
  )


(comment "old "
 (load-library "docker-tramp.el/docker-tramp.el")
 (require 'docker-tramp)
 )

;;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(use-package docker

  :straight nil
:ensure t
  :bind ("C-c d" . docker)
  )
