;;;  -*- lexical-binding: t; -*-

(load! "+gtd")
(load! "+web")
(load! "+git")
(load! "+ivy")
(load! "+edit")
(load! "+tool")
(load! "+shell")
(load! "+scheme")
(load! "+paredit")
(load! "+template")
(load! "+completion")


(setq doom-font (font-spec :family "Hack" :size 19)
      doom-variable-pitch-font (font-spec :family "Hack")
      doom-unicode-font (font-spec :family "WenQuanYi Micro Hei" :size 19)
      doom-serif-font (font-spec :family "WenQuanYi Micro Hei" :size 19)
      doom-big-font (font-spec :family "Hack" :size 24)
      c-basic-offset 2
      markdown-command "pandoc"
      frame-resize-pixelwise t
      evil-default-state 'emacs
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

(when (featurep! :ui workspaces)
  (insert-hook 'window-setup-hook 'doom|display-benchmark '+workspace/restore-last-session))

;; disable org-mode's auto wrap
(remove-hook 'org-mode-hook 'auto-fill-mode)

(toggle-frame-maximized)
