(load-file "~/.emacs.d/local/ob-untangle.el")

(use-package dot-mode
  :straight t

)

(require 'ob-dot)




(setq org-export-babel-evaluate t)

(setq org-hide-emphasis-markers t)

(global-auto-revert-mode)

(setq org-startup-with-inline-images t)


(org-babel-do-load-languages
  'org-babel-load-languages
  '((clojure . t)
    (dot . t)
    (shell . t)
    (sql . t)
    ;;(http . t)
    (emacs-lisp . t)))

(add-hook 'org-mode-hook 'org-hide-block-all)

(add-hook 'org-mode-hook 'org-babel-result-hide-all)

(use-package htmlize
  :straight t
)

(defun org-babel-tangle-append ()
  "Append source code block at point to its tangle file.
The command works like `org-babel-tangle' with prefix arg
but `delete-file' is ignored."
  (interactive)
  (cl-letf (((symbol-function 'delete-file) #'ignore))
    (org-babel-tangle '(4))))

(defun org-babel-tangle-append-setup ()
  "Add key-binding C-c C-v C-t for `org-babel-tangle-append'."
  (org-defkey org-mode-map (kbd "C-c C-v +") 'org-babel-tangle-append))

(add-hook 'org-mode-hook #'org-babel-tangle-append-setup)

;; (require 'ob-clojure)

;; (setq org-babel-clojure-nrepl-timeout nil)

;; (setq org-babel-clojure-backend 'cider)

(use-package ob-clojure

  :config
  (use-package clojure-mode
    :straight t)
  (require 'ob-clojure)
  (use-package cider
    :straight t)
  (setq org-babel-clojure-backend 'cider)
  (defun org-babel-expand-body:clojure (body params)
    "Expand BODY according to PARAMS, return the expanded body."
    (let* ((vars (org-babel--get-vars params))
         (ns (or (cdr (assq :ns params))
               (org-babel-clojure-default-ns) ;;(org-babel-clojure-cider-current-ns)
                 ))
         (result-params (cdr (assq :result-params params)))
         (print-level nil)
         (print-length nil)
         (body (org-trim
              (concat
               ;; Source block specified namespace :ns.
               (and (cdr (assq :ns params)) (format "(ns %s)\n" ns))
               ;; Variables binding.
               (if (null vars) (org-trim body)
                 (format "(let [%s]\n%s)"
                       (mapconcat
                        (lambda (var)
                          (format "%S (quote %S)" (car var) (cdr var)))
                        vars
                        "\n      ")
                       body))))))
      (if (or (member "code" result-params)
            (member "pp" result-params))
        (format "(print (str (do %s)))" body)
        body))))

(use-package ob-http
  :straight t
)
