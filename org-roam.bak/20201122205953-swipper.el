(use-package ivy
  :straight t
  )

(use-package counsel
  :straight t
 )

(use-package swiper
  :straight t

  :bind (("C-s" . swiper))
  :config (ivy-mode 1)
  :custom ((ivy-use-virtual-buffers t)
           (enable-recursive-minibuffers t)))


(setq ivy-re-builders-alist
      '((read-file-name-internal . ivy--regex-fuzzy)
        (counsel-M-x . ivy--regex-ignore-order-2 ;;ivy--regex-fuzzy
                     )
        (t . ivy--regex-plus)))

(defun ivy--split-hyphen (str)
  "Split STR on spaces, unless they're preceded by \\.
No unescaped spaces are left in the output.  Any substring not
constituting a valid regexp is passed to `regexp-quote'."
  (when str
    (let ((i 0)                        ; End of last search.
          (j 0)                        ; End of last delimiter.
          parts)
      (message "str: %s %s" str (string-match "-" str i))
      (while (string-match "-" str i)
        (setq i (match-end 0))
        (if (not (match-beginning 1))
            ;; Unescaped space(s).
            (let ((delim (match-beginning 0)))
              (when (< j delim)
                (push (substring str j delim) parts))
              (setq j i))
          ;; Store "\ " as " ".
          (setq str (replace-match " " t t str 1))
          (setq i (1- i))))
      (when (< j (length str))
        (push (substring str j) parts))
      (message "all parts %s" parts)
      (mapcar #'ivy--regex-or-literal (nreverse parts)))))

(defun ivy--regex-ignore-order-2 (str)
  (let* (regex-parts
         (raw-parts (ivy--split-negation str)))
    (dolist (part (ivy--split-hyphen (car raw-parts)))
      (message "part: %s" part)
      (push (cons part t) regex-parts))
    (when (cdr raw-parts)
      (dolist (part (ivy--split-hyphen (cadr raw-parts)))
        (message "part2: %s" part)
        (push (cons part nil) regex-parts)))
    (if regex-parts (nreverse regex-parts)
      "")))
