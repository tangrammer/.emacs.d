(unless (package-installed-p 'restclient)
  (package-install 'restclient))
(require 'restclient)
