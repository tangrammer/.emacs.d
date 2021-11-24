(unless (package-installed-p 'toc-org)
  (package-install 'toc-org))
(require 'toc-org)
(add-hook 'org-mode-hook 'toc-org-enable)
