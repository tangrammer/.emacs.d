(set-face-attribute 'default nil :height 180)

 ;; Set the default comment column to 70

 (setq-default comment-column 70)

 (set-language-environment "UTF-8")

 ;; Every time a window is started, make sure it get maximized

 (add-to-list 'default-frame-alist '(fullscreen . maximized))


 ;; switch to other frame http://stackoverflow.com/questions/93058/emacs-switching-to-another-frame-mac-os-x
 (global-set-key (kbd "M-o") 'other-frame)




(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

(unless (package-installed-p 'win-switch)
  (package-install 'win-switch))
(require 'win-switch)
(global-set-key (kbd "C-x o") 'win-switch-dispatch)

(unless (package-installed-p 'projectile)
  (package-install 'projectile))
(require 'projectile)
(projectile-global-mode)
