(use-package org-journal

  :defer t
  :init
  ;; Change default prefix key; needs to be set before loading org-journal
  (setq org-journal-prefix-key "C-c j ")
  :config
  (setq org-journal-dir "~/git/journal/"))

;; org-journal-dir => ~/Documents
