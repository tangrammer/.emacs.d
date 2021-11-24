(defun t-copy-last-message-into-buffer ()
  (interactive)
  (let ((b (buffer-name)))
    (with-current-buffer b
      (let ((data (save-excursion
                    (switch-to-buffer "*Messages*")
                    (-last-item (-butlast (split-string (buffer-string) "\n" t)))
                    )))
        (switch-to-buffer b)
        (insert data)))))
