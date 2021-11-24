(use-package flycheck-clj-kondo
:straight t)
(require 'flycheck-clj-kondo)

(defun connect-lument-repl ()
  (interactive)
  ;;(cider-connect  "47480" "~/git/akvo/akvo-lumen/backend")
  (cider-nrepl-connect
   (list :host "localhost" :port "47480"
	 :repl-type "clj"
	 :repl-init-function nil
	 :session-name nil
	 :project-dir "~/git/akvo/akvo-lumen/backend"))

  (cider-interactive-eval "(require '[clj-stable-pprint.core :as spp])"))

(define-key global-map (kbd "C-c l") 'connect-lument-repl)

;; https://github.com/rkaercher/hugsql-ghosts
;; (require 'hugsql-ghosts)

;; (add-hook 'cider-mode-hook 'hugsql-ghosts-install-hook)

(defun pprint ()
 (interactive)
 (cider-pprint-eval-last-sexp-to-comment))

;;(define-key cider-mode-map (kbd "C-c C-S-p") 'pprint)
;;(define-key cider-mode-map (kbd "C-c C-p") 'cider-pprint-eval-last-sexp)
