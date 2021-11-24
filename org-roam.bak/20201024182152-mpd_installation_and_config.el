(use-package libmpdel
    :straight t
    )

(use-package mpdel
    :straight t
    :config
    (mpdel-mode))
(setq mpdel-prefix-key (kbd "C-. z"))

(use-package ivy-mpdel
  :straight t
  )
