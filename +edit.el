;;;  -*- lexical-binding: t; -*-

(global-set-key (kbd "RET") 'newline-and-indent)
(defun sanityinc/newline-at-end-of-line ()
  "Move to end of line, enter a newline, and reindent."
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))

(global-set-key (kbd "S-<return>") 'sanityinc/newline-at-end-of-line)

(delete-selection-mode)

(when (fboundp 'electric-pair-mode)
  (add-hook 'doom-post-init-hook 'electric-pair-mode))
(when (eval-when-compile (version< "24.4" emacs-version))
  (add-hook 'doom-post-init-hook 'electric-indent-mode))
