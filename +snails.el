;;; ~/.doom.d/+snails.el -*- lexical-binding: t; -*-

(use-package! snails
  :bind (("C-x C-b" . snails)
         ("C-x M-b" . snails-search-point))
  :config
  (set-face-attribute 'snails-content-buffer-face nil :height 240)
  )
