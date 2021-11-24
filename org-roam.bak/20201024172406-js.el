(use-package js2-mode
  :straight t
  ;;  :hook (dumb-jump-mode)
  :config
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 2)
  (setq-default js2-basic-offset 2))

;; configure indentation
;; https://github.com/mooz/js2-mode/issues/339

(use-package indium

  :straight t
;;  :hook (hs-minor-mode)
    )

(use-package js-comint

  :straight t
;;  :hook (hs-minor-mode)
    )

(add-hook 'rjsx-mode-hook
          (lambda ()
            (local-set-key (kbd "C-x C-e") 'js-send-last-sexp)
            (local-set-key (kbd "C-M-x") 'js-send-last-sexp-and-go)
            (local-set-key (kbd "C-c b") 'js-send-buffer)
            (local-set-key (kbd "C-c C-b") 'js-send-buffer-and-go)
            (local-set-key (kbd "C-c l") 'js-load-file-and-go)))
