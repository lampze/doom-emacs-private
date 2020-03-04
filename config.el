;;;  -*- lexical-binding: t; -*-

(load! "+gtd")
(load! "+web")
(load! "+git")
(load! "+ivy")
(load! "+edit")
(load! "+tool")
(load! "+hack")
(load! "+shell")
(load! "+snails")
(load! "+scheme")
(load! "+paredit")
(load! "+org-page")
(load! "+template")
(load! "+completion")

;;; Hack
(setq doom-font (font-spec :family "iosevka" :size 24)
      doom-variable-pitch-font (font-spec :family "Hack")
      doom-unicode-font (font-spec :family "WenQuanYi Micro Hei" :size 24)
      doom-serif-font (font-spec :family "WenQuanYi Micro Hei" :size 24)
      doom-big-font (font-spec :family "iosevka" :size 24)
      company-idle-delay 0.2
      c-basic-offset 2
      markdown-command "pandoc"
      frame-resize-pixelwise t
      evil-default-state 'emacs
      )

(def-package! eaf
  :custom
  (eaf-find-alternate-file-in-dired t)
  :config
  (eaf-bind-key scroll_up "RET" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_down_page "DEL" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
  (eaf-bind-key take_photo "p" eaf-camera-keybinding))

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

;; disable org-mode's auto wrap
(remove-hook 'org-mode-hook 'auto-fill-mode)

(+global-word-wrap-mode +1)

(toggle-frame-maximized)
