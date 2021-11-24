;; save all open buffers
(global-set-key
 (kbd "C-X C-S")
 (lambda ()
   (interactive)
   (save-some-buffers t)))
