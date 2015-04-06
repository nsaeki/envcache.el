# envcache.el

Fetch and cache shell environment variables.

## install

Download el file and place it in your own emacs directory.

https://raw.githubusercontent.com/nsaeki/envcache.el/master/envcache.el

## setup

```elisp
(require 'envcache)
;; cache environment variables
(envcache/init)
;; fetch value
(setenv "GOPATH" (envcache/getenv "GOPATH"))
```
