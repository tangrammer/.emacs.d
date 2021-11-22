(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))


(setq org-roam-v2-ack t)

;;(setq auto-save-default nil)
;;(setq make-backup-files nil)
(defvar --backup-directory (concat user-emacs-directory "backups"))
(if (not (file-exists-p --backup-directory))
        (make-directory --backup-directory t))
(setq backup-directory-alist `(("." . ,--backup-directory)))
(setq make-backup-files t               ; backup of a file the first time it is saved.
      backup-by-copying t               ; don't clobber symlinks
      version-control t                 ; version numbers for backup files
      delete-old-versions t             ; delete excess backup files silently
      delete-by-moving-to-trash t
      kept-old-versions 6               ; oldest versions to keep when a new numbered backup is made (default: 2)
      kept-new-versions 9               ; newest versions to keep when a new numbered backup is made (default: 2)
      auto-save-default t               ; auto-save every buffer that visits a file
      auto-save-timeout 20              ; number of seconds idle time before auto-save (default: 30)
      auto-save-interval 200            ; number of keystrokes between auto-saves (default: 300)
      )


;; * use my orgmode
;; _(to fix babel + clojure)_
;; Download from [[https://orgmode.org/][orgmode]] the zip and point it in the following line
;;(add-to-list 'load-path "/Users/tangrammer/tools/org-9.1.13/lisp")
;;(add-to-list 'load-path "~/git/tangrammer/org-mode/lisp")
;; (add-to-list 'load-path "~/.emacs.d/local/")
;; (add-to-list 'load-path "~/.emacs.d/local/nano-emacs")
;; (add-to-list 'load-path "~/.emacs.d/local/git-link")
;; (add-to-list 'load-path "~/.emacs.d/local/org-download")
;; (add-to-list 'load-path "~/.emacs.d/local/org-roam-server")

(load-file "~/.emacs.d/env.el")


;;(package-initialize)
;;(package-refresh-contents)

(straight-use-package 'use-package)

(use-package org :straight nil)

;;(straight-use-package 'org)

(org-babel-load-file "~/.emacs.d/top-level-packages.org")

(let((dir "~/.emacs.d/configuration/"))
  ;; remove first all .el files except .dir-locals.el
  (->> (directory-files dir)
        (--filter (and (not (string= ".dir-locals.el" it)) (string= "el" (file-name-extension it))))
        (--map (let ((file-to-load (concat dir it)))
                 (ignore-errors (delete-file file-to-load)))))
  ;; tangle and load all org
  (->> (directory-files dir)
       (--filter (string= "org" (file-name-extension it)))
       (--map (let ((file-to-load (concat dir it)))
                (message file-to-load)
                (ignore-errors (org-babel-load-file file-to-load))))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(epg-gpg-program "/usr/local/bin/gpg")
 '(safe-local-variable-values
   '((org-roam-db-location . "~/.emacs.d/configuration/emacs-configuration.db")
     (org-roam-directory . "~/.emacs.d/configuration"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

 (global-set-key (kbd "M-+") 'hs-show-block)
 (global-set-key  (kbd "M-*") 'hs-show-all)
 (global-set-key (kbd "M--")  'hs-hide-block)
 (global-set-key (kbd "M-Ç") 'hs-hide-level)
 (global-set-key (kbd "M-:") 'hs-hide-all)

 (add-hook 'rjsx-mode-hook #'hs-minor-mode)
 (add-hook 'js-mode-hook #'hs-minor-mode)
 (add-hook 'js2-mode-hook #'hs-minor-mode)

(add-hook 'web-mode-hook 'hs-minor-mode)
 (add-hook 'clojure-mode-hook 'hs-minor-mode)
 (add-hook 'cider-mode-hook 'hs-minor-mode)

 (add-hook 'lisp-mode-hook 'hs-minor-mode)
 (add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
