;;; ob-untangle.el --- Babel Functions for Emacs-lisp Code -*- lexical-binding: t; -*-

;; Copyright (C) 2009-2020 Free Software Foundation, Inc.

;; Author: Eric Schulte
;; Keywords: literate programming, reproducible research
;; Homepage: https://orgmode.org

;; This file is part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Org-Babel support for evaluating untangle code

;;; Code:

(require 'ob-core)

(declare-function org-babel--get-vars "ob" (params))
(declare-function org-babel-result-cond "ob" (result-params scalar-form &rest table-forms))
(declare-function org-babel-reassemble-table "ob" (table colnames rownames))
(declare-function org-babel-pick-name "ob" (names selector))

(defalias 'org-babel-header-args:untangle 'org-babel-header-args:emacs-lisp)

(defalias 'org-babel-default-header-args:untangle 'org-babel-default-header-args:emacs-lisp)

(defalias 'org-babel-expand-body:untangle 'org-babel-expand-body:emacs-lisp)

(defalias 'org-babel-execute:untangle 'org-babel-execute:emacs-lisp)

(defalias 'org-babel-untangle-lexical 'org-babel-emacs-lisp-lexical)

(defalias 'org-babel-edit-prep:untangle 'org-babel-edit-prep:emacs-lisp)
(defalias 'untangle-mode 'emacs-lisp-mode)
(provide 'ob-untangle)

;;; ob-untangle.el ends here


