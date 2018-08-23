;;; ~/.doom.d/+shell.el -*- lexical-binding: t; -*-

(def-package! aweshell
  :commands (aweshell-new aweshell-next aweshell-prev aweshell-clear-buffer aweshell-sudo-toggle)
  :ensure t
  :defer t)
