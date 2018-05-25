;; emacs installed following this steps
;; https://stackoverflow.com/a/44094859/1074389
;; brew uninstall emacs
;; brew cleanup
;; brew doctor
;; brew update
;; brew upgrade
;; brew install emacs --with-cocoa --with-gnutls --with-rsvg --with-imagemagick

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")))
(package-initialize)

;; * use my orgmode 
;; _(to fix babel + clojure)_ 
;; Download from [[https://orgmode.org/][orgmode]] the zip and point it in the following line 
(add-to-list 'load-path "/Users/tangrammer/tools/org-9.1.13/lisp") 
(require 'org)
(setq org-edit-src-content-indentation 0
      org-src-tab-acts-natively t
      org-src-fontify-natively t
      org-confirm-babel-evaluate nil
      org-support-shift-select 'always)

;; https://harryrschwartz.com/2016/02/15/switching-to-a-literate-emacs-configuration.html
(org-babel-load-file "~/.emacs.d/configuration.org")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (toc-org logview helm helm-open-github restclient win-switch paredit idomenu projectile multiple-cursors smartparens rainbow-delimiters ob-http expand-region company-flx company company-mode magit yasnippet which-key macrostep cider))))
