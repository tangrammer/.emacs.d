;;http://stackoverflow.com/questions/2416655/file-path-to-clipboard-in-emacs
(defun tangrammer-file-name-on-clipboard ()
  "Put the current file name on the clipboard"
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (with-temp-buffer
        (insert filename)
        (clipboard-kill-region (point-min) (point-max)))
      (message filename))))

;; https://gist.github.com/tangrammer/ca3e00007d560b6721818bfe385b5b98
(defun tang-copy-current-line-position-to-clipboard ()
  "Copy current line in file to clipboard as '</path/to/file>:<line-number>'"
  (interactive)
  (let ((path-with-line-number
         (concat (buffer-file-name) "::" (number-to-string (line-number-at-pos)))))
    (when path-with-line-number
      (with-temp-buffer
        (insert path-with-line-number)
        (clipboard-kill-region (point-min) (point-max)))
      (message (concat path-with-line-number " copied to clipboard")))))

(define-key global-map (kbd "M-l") 'tang-copy-current-line-position-to-clipboard)
