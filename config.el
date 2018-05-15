;;;  -*- lexical-binding: t; -*-

(load! +org)
(load! +web)
(load! +git)
(load! +edit)
(load! +paredit)
(load! +completion)

;; Smooth mouse scrolling
(setq mouse-wheel-scroll-amount '(2 ((shift) . 1))  ; scroll two lines at a time
      mouse-wheel-progressive-speed nil             ; don't accelerate scrolling
      mouse-wheel-follow-mouse t                    ; scroll window under mouse
      scroll-step 1)


;; Backups
(setq make-backup-files t
      backup-by-copying t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(when (not (featurep! :ui doom-quit))
  (setq confirm-kill-emacs nil))

(when (featurep! :feature workspaces)
  (add-hook! :append 'doom-init-hook '+workspace/load-session))

(toggle-frame-maximized)
