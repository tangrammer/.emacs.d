(defun path-data*()
  (let* ((fnnd (file-name-nondirectory  (buffer-file-name)))
	(fnse (file-name-sans-extension fnnd))
	(bfn (buffer-file-name))
	(cpd (clojure-project-dir))
	(frn (file-relative-name bfn cpd))
	(path (replace-regexp-in-string  "src" "" frn))
	(path* (replace-regexp-in-string fnnd "" path))
	(res (list cpd  path* fnse )))
    res))


(defun path*(place)
   (nth place (path-data*)))

(defun read-dir-locals (dir)
  (with-temp-buffer
    (insert-file-contents (format  "%s/.dir-locals.el" dir))
    (--map  (eval (read (format "(%s %s \"%s\")" 'setq-local (-last-item it) (rest it))))
            (eval (quote  (rest  (car (read (buffer-string)))))))))

(defun extract-dir (path)
  (string-join  (butlast (split-string path "\\/")) "/"))

(extract-dir "~/git/akvo/akvo-lumen/backend/roam/20201102093126-index.org")

(defun private-git-dropbox (project-name)
       "Set a private git dropbox"
       (interactive "sEnter your project name: ")
       (let* ((pwd (string-trim (shell-command-to-string "pwd"))))
         (shell-command-to-string "git init")
         (shell-command-to-string "git add .")
         (shell-command-to-string "git commit -m \"first commit\"")
         (let ((default-directory "/Volumes/winnie/Dropbox/funicular"))
           (shell-command-to-string (format "git init --bare %s.git" project-name))
           )
         (shell-command-to-string (format "git remote add dropbox /Volumes/winnie/Dropbox/funicular/%s.git" project-name))
         (shell-command-to-string "git push -u dropbox master")
         (message "your project %s has been initialised!" project-name)))
