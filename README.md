# envcache.el

Load and cache shell environment variables.

This el caches environment variables in list at one time and you'll
get these variable faster (without invoking shell) when you want to
use it.

## Install

Download el file and place it in your own emacs directory.

https://raw.githubusercontent.com/nsaeki/envcache.el/master/envcache.el

## Setup

```elisp
(require 'envcache)
;; Lanunch shell and cache environment variables
(envcache/init)
;; Fetch value
(setenv "GOPATH" (envcache/getenv "GOPATH"))
```

## Motivation

When you open Emacs in GUI mode from launcher app or something like
that, shell environment variables are not loaded. If you want to use
these values in Emacs, you need to load into Emacs like
`(shell-command-to-string "env")`. This type of function invokes shell
inside, therefore it takes longer time than normal Emacs lisp
functions (in my machine, 0.8 sec for each time). If you will use two
or more variables in Emacs and write load function in your init.el for
each point, it will make Emacs launch more and more slowly. (Of
course, I rarely restart Emacs ;)
