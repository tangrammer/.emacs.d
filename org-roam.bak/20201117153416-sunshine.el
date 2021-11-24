(straight-use-package
 '(sunshine :type git :host github :repo "aaronbieber/sunshine.el"))

(require 'sunshine)
   (setq sunshine-appid (getenv "SUNSHINE_APPID")) ;; loaded from env.el
   (setq sunshine-location "Seville,ES")
   (setq sunshine-units 'metric)
   (setq sunshine-show-icons t)
   ;;(setq sunshine-forecast-date t)
