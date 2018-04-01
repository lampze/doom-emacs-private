;;;  -*- lexical-binding: t; -*-

(setq-default magit-diff-refine-hunk t)

(map!
 "C-x g" 'magit-status
 "C-x M-g" 'magit-dispatch-popup)

(add-hook 'git-commit-mode-hook 'goto-address-mode)
