;;;  -*- lexical-binding: t; -*-

(use-package! paredit
  :hook ((scheme-mode . enable-paredit-mode)
         (emacs-lisp-mode . enable-paredit-mode)))
