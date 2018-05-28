;;;  -*- lexical-binding: t; -*-

(load! "+org")
(load! "+web")
(load! "+git")
(load! "+edit")
(load! "+paredit")
(load! "+completion")


(setq doom-font (font-spec :family "Hack" :size 19)
      doom-variable-pitch-font (font-spec :family "Hack")
      doom-unicode-font (font-spec :family "文泉驿等宽微米黑" :size 19)
      doom-big-font (font-spec :family "Hack" :size 24)
      frame-resize-pixelwise t
      )

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
  (add-hook! :append 'doom-post-init-hook '+workspace/load-session))

(toggle-frame-maximized)
