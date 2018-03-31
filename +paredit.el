;;;  -*- lexical-binding: t; -*-

(def-package! paredit
  :hook ((scheme-mode . enable-paredit-mode)
         (emacs-lisp-mode . enable-paredit-mode)))
