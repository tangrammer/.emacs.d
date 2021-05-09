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

(setq make-backup-files nil)
(setq backup-directory-alist '(("" . "~/.emacs.d/backup")))


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

(straight-use-package 'org)

(org-babel-load-file "~/.emacs.d/top-level-packages.org")

(custom-set-variables
 '(safe-local-variable-values
   '((org-roam-db-location . "~/.emacs.d/configuration/emacs-configuration.db")
     (org-roam-directory . "~/.emacs.d/configuration"))))

(require 'dash)
(let((dir "~/.emacs.d/configuration/"))
  ;; remove first all .el files except .dir-locals.el
  ;; (->> (directory-files dir)
  ;;       (--filter (and (not (string= ".dir-locals.el" it)) (string= "el" (file-name-extension it))))
  ;;       (--map (let ((file-to-load (concat dir it)))
  ;;                (ignore-errors (delete-file file-to-load)))))
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
 '(package-selected-packages
   '(simple-httpd yasnippet-snippets yaml-mode win-switch which-key web-mode w3 use-package toc-org symbol-overlay sqlite solarized-theme smartparens rjsx-mode restclient remind-bindings rainbow-delimiters projectile powerline paredit pamparam org-roam-server org-ref org-journal org-ehtml org-download org-bullets olivetti ob-http mpdel mini-frame meghanada marginalia magithub magit-todos macrostep logview lively kubernetes keypression json-mode js-comint jdee indium imenu-list idomenu icomplete-vertical helpful helm-swoop helm-open-github handlebars-sgml-mode handlebars-mode gruvbox-theme gist flycheck-clj-kondo expand-region exec-path-from-shell ess engine-mode emacsql-sqlite elisp-format dumb-jump csv-mode company-flx command-log-mode clomacs anki-editor))
 '(safe-local-variable-values
   '((org-roam-db-location . "~/.emacs.d/configuration/emacs-configuration.db")
     (org-roam-directory . "~/.emacs.d/configuration")))
 '(transient-force-fixed-pitch t)
 '(which-key-side-window-max-height 0.6)
 '(which-key-side-window-max-width 0.6))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
