;;  make autoloads ;; do that in terminal and... it requires to have installed `cask`


(use-package cider
  :straight t)

(use-package clojure-mode
  :straight t)

(use-package sesman
  :straight t)


      ;;; https://cider.readthedocs.io/en/latest/hacking_on_cider/#obtaining-the-source-code

;; (add-to-list 'load-path "~/git/tangrammer/cider")

;; (require 'cider)
;; (require 'cider-autoloads)

(org-defkey org-mode-map "\C-x\C-e" 'cider-eval-last-sexp)
(org-defkey org-mode-map "\C-c\C-d" 'cider-doc)
(org-defkey org-mode-map "\C-c\M-j" 'cider-jack-in)

;; Show documentation/information with M-RET
(define-key lisp-mode-shared-map (kbd "M-RET") 'live-lisp-describe-thing-at-point)
;;  (define-key cider-repl-mode-map (kbd "M-RET") 'cider-doc)
;;  (define-key cider-mode-map (kbd "M-RET") 'cider-doc)


;; clojure figwheel
;; https://github.com/bhauman/lein-figwheel/wiki/Running-figwheel-with-Emacs-Inferior-Clojure-Interaction-Mode
;; (defun figwheel-repl ()
;;   (interactive)
;;   (run-clojure "lein figwheel"))

;;(add-hook 'clojure-mode-hook #'inf-clojure-minor-mode)

;;  (define-key cider-repl-mode-map (kbd "C-c C-o") 'cider-repl-clear-output)


;; https://github.com/stuartsierra/component/issues/55
;; emacs, init.el

;; find all buffers names which match `reg`, regex
(defun find-buffer-regex (reg)
  (interactive)
  (remove-if-not #'(lambda (x) (string-match reg x))
                 (mapcar #'buffer-name (buffer-list))))

(defun cider-execute (command)
  (interactive)
  (set-buffer (car (find-buffer-regex "cider-repl.*")))
  (goto-char (point-max))
  (insert command)
  (cider-repl-return))

(defun nrepl-reset ()
  (interactive)
  (cider-execute "(clojure.tools.namespace.repl/refresh)"))

;;  (define-key cider-mode-map (kbd "C-c r") 'nrepl-reset)

;;  (define-key cider-repl-mode-map (kbd "C-c r") 'nrepl-reset)

(defun nrepl-test ()
  (interactive)
  (nrepl-reset)
  (cider-execute "(duct.util.repl/test)"))
;;  (define-key cider-mode-map (kbd "C-c t") 'nrepl-test)


(setq cider-cljs-lein-repl
      "(do (require 'figwheel-sidecar.repl-api)
        (figwheel-sidecar.repl-api/start-figwheel!)
        (figwheel-sidecar.repl-api/cljs-repl))")


(setq nrepl-log-messages t)

(setq cider-repl-scroll-on-output nil)
(setq cider-show-eval-spinner nil)


;; (let ((resp (cider-nrepl-sync-request:eval "(+ 1 1)")))
;;    (nrepl-dict-get resp "value"))


(defun browse-spec (spec)
  (interactive (list (cider-symbol-at-point)) )
  (let ((last-sexp (nrepl-dict-get (cider-nrepl-sync-request:eval (cider-symbol-at-point)) "value")))
    (cider-browse-spec last-sexp)))

;;  (define-key cider-mode-map (kbd "<M-S-return>") 'browse-spec)

(add-hook 'cider-repl-mode-hook #'paredit-mode)
(add-hook 'cider-mode-hook #'paredit-mode)
(add-hook 'clojure-mode-hook #'hs-minor-mode)
(add-hook 'clojure-mode-hook #'paredit-mode)
