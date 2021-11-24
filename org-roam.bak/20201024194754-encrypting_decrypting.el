(use-package epa-file
  :init
  (epa-file-enable)
  :config
  (custom-set-variables '(epg-gpg-program  "/usr/local/bin/gpg")))
