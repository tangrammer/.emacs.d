(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")))

;; * use my orgmode 
;; _(to fix babel + clojure)_ 
;; Download from [[https://orgmode.org/][orgmode]] the zip and point it in the following line 
;;(add-to-list 'load-path "/Users/tangrammer/tools/org-9.1.13/lisp")
;;(add-to-list 'load-path "~/git/tangrammer/org-mode/lisp")
(add-to-list 'load-path "~/.emacs.d/local/")

(package-initialize)
;;(package-refresh-contents)


(require 'org)

(defmacro comment (&rest body)
  "Comment out one or more s-expressions."
  nil)

(org-babel-load-file "~/.emacs.d/top-level-packages.org")

(require 'dash)
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


;; (setq multi-term-program "/bin/zsh")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(minibuffer-prompt ((t (:background "light green" :foreground "dark magenta" :weight normal))))
 '(sunshine-forecast-date-face ((t (:foreground "dark magenta" :weight ultra-bold))))
 '(which-key-key-face ((t (:inherit font-lock-constant-face :height 1.0))))
 '(which-key-note-face ((t (:inherit which-key-separator-face :height 1.0)))))

;; https://github.com/purcell/exec-path-from-shell
;; only need exec-path-from-shell on OSX
;; this hopefully sets up path and other vars better
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;;(agenda)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-sources (quote ("~/.authinfo" "~/.authinfo.gpg" "~/.netrc")))
 '(blink-cursor-interval 0.5)
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("123a8dabd1a0eff6e0c48a03dc6fb2c5e03ebc7062ba531543dfbce587e86f2a" "a06658a45f043cd95549d6845454ad1c1d6e24a99271676ae56157619952394a" "939ea070fb0141cd035608b2baabc4bd50d8ecc86af8528df9d41f4d83664c6a" "aded61687237d1dff6325edb492bde536f40b048eab7246c61d5c6643c696b7f" "4cf9ed30ea575fb0ca3cff6ef34b1b87192965245776afa9e9e20c17d115f3fb" default)))
 '(epg-gpg-program "/usr/local/bin/gpg")
 '(fci-rule-color "#073642")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(hl-paren-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
 '(jdee-server-dir "~/tools/jdee-server/target/")
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(org-agenda-files (quote ("/Users/tangrammer/git/orgs/gtd/notes.org")))
 '(package-selected-packages
   (quote
    (yasnippet-snippets org-download symbol-overlay magit-todos org-journal engine-mode org org-roam-server remind-bindings org-roam sqlite emacsql-sqlite3 csv-mode meghanada hl-todo keypression org-ref helm-swoop gruvbox-theme elisp-format mini-frame handlebars-sgml-mode handlebars-mode ess ada-ref-man kubernetes imenu-list helpful yaml-mode kubernetes-el js-comint indium dumb-jump js2-mode cider sqlformat clojure-mode use-package magithub rjsx-mode exec-path-from-shell json-mode flycheck ivy-mpdel mpdel jdee gist solarized-theme solarized-dark-theme solarized-dark counsel swiper ivy lively command-log-mode w3 powerline org-bullets htmlize org-ehtml emacs-htmlize toc-org logview helm helm-open-github restclient win-switch paredit idomenu projectile multiple-cursors smartparens rainbow-delimiters ob-http expand-region company-flx company company-mode magit web-mode)))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(safe-local-variable-values
   (quote
    ((eval setq-local org-roam-directory
           (expand-file-name "./"))
     (org-roam-directory . "~/.emacs.d/configuration")
     (org-roam-db-location . "~/.emacs.d/configuration/emacs-configuration.db"))))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c9485ddd1797")
     (60 . "#bf7e73b30bcb")
     (80 . "#b58900")
     (100 . "#a5a58ee30000")
     (120 . "#9d9d91910000")
     (140 . "#9595943e0000")
     (160 . "#8d8d96eb0000")
     (180 . "#859900")
     (200 . "#67119c4632dd")
     (220 . "#57d79d9d4c4c")
     (240 . "#489d9ef365ba")
     (260 . "#3963a04a7f29")
     (280 . "#2aa198")
     (300 . "#288e98cbafe2")
     (320 . "#27c19460bb87")
     (340 . "#26f38ff5c72c")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(which-key-frame-max-height 100)
 '(which-key-frame-max-width 100)
 '(which-key-side-window-max-width 0.6)
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))



