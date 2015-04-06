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
;; The MIT License (MIT)
;;
;; Copyright (c) 2015 Nobuo Saeki
;;
;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;;
;; The above copyright notice and this permission notice shall be included in all
;; copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.
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
