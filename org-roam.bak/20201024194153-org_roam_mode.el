(add-to-list 'package-archives
    '("MELPA" .
      "https://melpa.org/packages/"))
(package-initialize)

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (file-truename "~/.emacs.d/configuration"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol))

(defun t/roam/go (choice)
  (interactive
   (let ((completion-ignore-case  t))
     (list (completing-read "Choose: " '("roam" "roam-emacs-conf" "unep" "roam-lumen" "roam-local") nil t))))
  (let ((dir (cond ((string= choice "roam-emacs-conf" ) "~/.emacs.d/configuration/20201025113623-configuration_index.org")
                   ((string= choice "roam" ) "~/org-roam/20201027120343-index.org")
                   ((string= choice "roam-local" ) "~/taller/20210604100524-tallerindex.org")
                   ((string= choice "unep" ) "~/git/akvo/unep-gpml/backend/roam/20210803193530-unep_index.org")
                   ((string= choice "roam-lumen" ) "~/git/akvo/akvo-lumen/backend/roam/20201102093126-index.org"))))
    (progn
      (let ((yup (find-file (extract-dir  dir))))
        (let ((default-directory (extract-dir  dir)))
          (progn

            ;;(org-roam-db-build-cache) ;; seems not necessary
            ;;(read-dir-locals default-directory) ;; finally just opening and killing the buffer to read the locals
            ;;(org-roam-build-cache)

            (call-interactively 'org-roam-find-file)
            (kill-buffer yup)
            ))))))

(defun >t/dir/go (choice)
  (interactive
   ;; complex code here that returns a list
   (let ((completion-ignore-case  t))
     (list (completing-read "Choose: " '( "data-science" "lumen" "lumen-backend" "emacs-init-config") nil t))))
  (let ((dir (cond ((string= choice "lumen" ) "~/git/akvo/akvo-lumen")
                   ((string= choice "lumen-backend" ) "~/git/akvo/akvo-lumen/backend/project.clj")
                   ((string= choice "data-science" ) "~/git/akvo/data-science/akvo-data-science-services")
                   ((string= choice "emacs-init-config" ) "~/.emacs.d/init.el"))))
    (find-file dir)))
