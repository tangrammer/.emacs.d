;; switching themes with keys asigned
(defun theme-clojure ()
  (interactive)
  (load-theme 'solarized-dark t))

(defun theme-org ()
  (interactive)
  ;; theme recommended by toxi for LP
  (load-theme 'leuven t))

(theme-org)



;; color-theme-buffer-local
;; package-install color-theme-buffer-local
;; M-x package-install color-theme-buffer-local
;; M-x package-install load-theme-buffer-local

;; Possible completions are:
;; adwaita 	deeper-blue 	dichromacy 	leuven
;; light-blue 	manoj-dark 	misterioso 	monokai
;; solarized 	solarized-dark 	solarized-light 	tango
;; tango-dark 	tsdh-dark 	tsdh-light 	wheatgrass
;; whiteboard 	wombat

;; (defun buffer-dark ()
;;   (interactive )
;;   (load-theme-buffer-local 'misterioso (current-buffer))
;;   )

;; (defun buffer-blue ()
;;   (interactive )
;;   (load-theme-buffer-local 'light-blue (current-buffer))
;;   )

;; (defun buffer-black ()
;;   (interactive )
;;   (load-theme-buffer-local 'wheatgrass (current-buffer))
;;   )
;; (defun buffer-gray ()
;;   (interactive )
;;   (load-theme-buffer-local 'dichromacy (current-buffer))
;;   )
