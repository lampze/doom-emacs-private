;;;  -*- lexical-binding: t; -*-

(global-set-key (kbd "RET") 'newline-and-indent)
(defun sanityinc/newline-at-end-of-line ()
  "Move to end of line, enter a newline, and reindent."
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))

(global-set-key (kbd "S-<return>") 'sanityinc/newline-at-end-of-line)

(delete-selection-mode)

;; electric-pair-mode
;; (when (fboundp 'electric-pair-mode)
;;   (add-hook 'doom-post-init-hook 'electric-pair-mode))
;; (when (eval-when-compile (version< "24.4" emacs-version))
;;   (add-hook 'doom-post-init-hook 'electric-indent-mode))

(setq electric-pair-open-newline-between-pairs nil)

;; multiple-cursors
(use-package! multiple-cursors
  :config
  (map!
   "C-<" 'mc/mark-previous-like-this
   "C->" 'mc/mark-next-like-this
   "C-+" 'mc/mark-next-like-this
   "C-c C-<" 'mc/mark-all-like-this
   "C-c m r" 'set-rectangular-region-anchor
   "C-S-<mouse-1>" 'mc/add-cursor-on-click))

;; move-text
(use-package! move-text
  :config
  (map!
   "M-p" 'move-text-up
   "M-n" 'move-text-down))

(map!
 (:map override
   "M-;")
 (:map evil-emacs-state-map
   (:after org
     "C-<return>" 'org-insert-heading
     "M-<return>" (lambda! (org-insert-heading)
                           (org-metaright)))))
