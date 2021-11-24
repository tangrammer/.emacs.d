(defclass transient-option-reactive (transient-option) ())

(cl-defmethod transient-infix-read ((obj transient-option-reactive))
  (let* ((choices (funcall (oref obj choices))))
    (with-slots (value multi-value always-read allow-empty) obj
      (if (and value
               (not multi-value)
               (not always-read)
               transient--prefix)
          (oset obj value nil)
        (let* ((overriding-terminal-local-map nil)
               (reader (oref obj reader))
               (prompt (transient-prompt obj))
               (value (if multi-value (mapconcat #'identity value ",") value))
               (history-key (or (oref obj history-key)
                                (oref obj command)))
               (transient--history (alist-get history-key transient-history))
               (transient--history (if (or (null value)
                                           (eq value (car transient--history)))
                                       transient--history
                                     (cons value transient--history)))
               (initial-input (and transient-read-with-initial-input
                                   (car transient--history)))
               (history (if initial-input
                            (cons 'transient--history 1)
                          'transient--history))
               (value
                (cond
                 (reader (funcall reader prompt initial-input history))
                 (multi-value
                  (completing-read-multiple prompt choices nil nil
                                            initial-input history))
                 (choices
                  (completing-read prompt choices nil t initial-input history))
                 (t (read-string prompt initial-input history)))))
          (cond ((and (equal value "") (not allow-empty))
                 (setq value nil))
                ((and (equal value "\"\"") allow-empty)
                 (setq value "")))
          (when value
            (when (bound-and-true-p ivy-mode)
              (set-text-properties 0 (length (car transient--history)) nil
                                   (car transient--history)))
            (setf (alist-get history-key transient-history)
                  (delete-dups transient--history)))
          value)))))
