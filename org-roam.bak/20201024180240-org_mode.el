(setq org-edit-src-content-indentation 0
      org-src-tab-acts-natively t
      org-src-fontify-natively t
      org-confirm-babel-evaluate nil
      org-support-shift-select 'always)

(add-hook 'org-mode-hook 'visual-line-mode)

(use-package org-bullets
  :straight t
  :config (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; (describe-variable 'org-goto-interface )
;; (describe-variable 'org-outline-path-complete-in-steps )

(setq org-goto-interface 'outline-path-completionp)
(setq org-outline-path-complete-in-steps nil)

(defun org-bolder (n)
  (interactive "p")
  (when (use-region-p)
    (save-excursion
      (goto-char (region-beginning))
      (insert "*")
      (line-beginning-position))
    (save-excursion
      (goto-char (region-end))
      (insert "*")
      (line-end-position))))

(defun negrita nil
  (interactive)
  (org-emphasize ?\*))

(defun cursiva nil
  (interactive)
  (org-emphasize ?\/))

(defun subrayado nil
  (interactive)
  (org-emphasize ?\_))


(org-defkey org-mode-map (kbd "C-c b")  'negrita)
;;(org-defkey org-mode-map (kbd "C-c i")  'cursiva)

(use-package org-outer-indent
  :straight (org-outer-indent :type git :host github :repo "rougier/org-outer-indent")
;;  :config (add-hook 'org-mode-hook 'org-outer-indent-mode)
;;  (add-hook 'org-mode-hook 'org-num-mode)
  )

(defun org-num-format (numbering)
  (cond ((= (length numbering) 1)
         (concat (propertize (format " %d " (nth 0 numbering))
                             'face 'nano-face-header-faded) " "))
        (t
         (propertize
          (concat (mapconcat #'number-to-string numbering ".") " ")
          'face 'nano-face-faded))))
(setq org-num-format-function #'org-num-format)

(face-remap-add-relative 'org-document-info
                         :inherit 'nano-face-faded)
;; (face-remap-add-relative 'org-document-title
;;                          :foreground nano-color-foreground
;;                          :family "Roboto Slab"
;;                          :height 250
;;                          :weight 'medium)
(font-lock-add-keywords 'org-mode '(("\\(^*+\\) " 0 'nano-face-faded)))

(setq org-num-face 'nano-face-faded)
(setq org-hidden-keywords '(author date startup))
(setq fill-column 70)
(setq-default line-spacing 1)

(straight-use-package '(org-appear :type git :host github :repo "awth13/org-appear"))
(add-hook 'org-mode-hook 'org-appear-mode)

(let ((table '(("a" "Hello") ("b" "World!"))))
(mapcar #'(lambda (x)
            (princ (format "%s [label =\"%s\", shape = \"box\"];\n"
                           (first x) (second x)))) table)
(princ (format "%s -- %s;\n" (first (first table)) (first (second table))))
)
