(require 'paredit)


;; remove last lines inside a fn
;;https://github.com/yatish27/emacs-live/blob/master/packs/dev/clojure-pack/config/paredit-conf.el
(defun live-paredit-delete-horizontal-space ()
  (interactive)
  (just-one-space -1)
  (paredit-backward-delete))

;; should be =>>> define-key paredit-mode-map
(global-set-key   (kbd "M-\\")    'live-paredit-delete-horizontal-space)
