;;; envcache.el --- Fetch and cache shell environment variables.
;;
;; Filename: envcache.el
;; Description: Fetch and cache shell environment variables.
;; Author: Nobuo Saeki
;; Maintainer: Nobuo Saeki
;; Created: Mon Apr  6 21:56:58 2015 (+0900)
;; Version: 0.0.1
;; Package-Requires: ()
;; URL: https://github.com/nsaeki/envcache.el
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or (at
;; your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(defvar envcache/env '())

(defun envcache/init ()
  nil
  (setq envcache/env '())
  (dolist (elem (split-string (shell-command-to-string "env") "\n"))
    (let ((pair (split-string elem "=")))
      (if (> (length pair) 1)
          (add-to-list 'envcache/env pair)))))

(defun envcache/getenv (key)
  nil
  (car (assoc-default key envcache/env)))

(provide 'envcache)
