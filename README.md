# envcache.el

Fetch and cache shell environment variables.

## install

Write this later.

## setup

```elisp
(require 'envcache)
;; cache envirnment variables
(envcache/init)
;; fetch value
(setenv "GOPATH" (envcache/getenv "GOPATH"))
```
