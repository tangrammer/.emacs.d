;; (unless (package-installed-p 'sqlformat)
;;   (package-install 'sqlformat))
(add-to-list 'load-path "~/.emacs.d/local/reformatter.el")
(add-to-list 'load-path "~/.emacs.d/local/sqlformat")

(require 'sqlformat)
