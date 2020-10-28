;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "shirui"
      user-mail-address "1229408499@qq.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))


;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/.org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq doom-font (font-spec :family "iosevka" :size 24)
      doom-variable-pitch-font (font-spec :family "iosevka")
      doom-unicode-font (font-spec :family "WenQuanYi Micro Hei" :size 24)
      doom-serif-font (font-spec :family "WenQuanYi Micro Hei" :size 24)
      doom-big-font (font-spec :family "iosevka" :size 24)
      company-idle-delay 0.2
      frame-resize-pixelwise t
      markdown-command "pandoc"
      evil-default-state 'emacs
      nov-save-place-file "~/.emacs.d/.local/cache/nov-places"
      eaf-config-location "~/.emacs.d/.local/cache/eaf/"
      posframe-mouse-banish nil

      company-lsp-cache-candidates t
      company-lsp-async t
      company-lsp-enable-snippet t
      company-lsp-enable-recompletion t
      lsp-auto-guess-root t
      lsp-enable-snippet t
      lsp-auto-configure t
      lsp-file-watch-threshold 10000000

      c-basic-offset 2
      tab-width 2
      web-mode-markup-indent-offset 2
      js-indent-level 2
      standard-indent 2

      default-input-method "rime"
      )

(after! org-re-reveal
  (setq org-re-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js"))


(map! (:map ivy-minibuffer-map
       "C-d" 'ivy-switch-buffer-kill)
      (:map org-mode-map
       "ESC <left>" 'org-metaleft))


(use-package! org-latex-instant-preview
  :defer t
  :hook (org-mode . org-latex-instant-preview-mode)
  :config
  (setq org-latex-instant-preview-scale 2.5)
  :init
  (setq org-latex-instant-preview-tex2svg-bin
        ;; location of tex2svg executable
        "~/.emacs.d/.local/etc/node/node_modules/mathjax-node-cli/bin/tex2svg"))


(use-package! english-teacher
  :hook ((Info-mode
          elfeed-show-mode
          eww-mode
          Man-mode
          Woman-Mode) . english-teacher-follow-mode)
  :config
  (setq english-teacher-show-result-function 'english-teacher-eldoc-show-result-function))


(use-package! rime
  :config
  (setq rime-user-data-dir "~/.local/share/fcitx5/rime"
        rime-posframe-style 'vertical
        rime-show-candidate 'posframe)
  :custom
  (default-input-method "rime")
  (rime-emacs-module-header-root "/usr/include/emacs-28-vcs"))


(use-package! multiple-cursors
  :config
  (map!
   "C-<" 'mc/mark-previous-like-this
   "C->" 'mc/mark-next-like-this
   "C-+" 'mc/mark-next-like-this
   "C-c C-<" 'mc/mark-all-like-this
   "C-c m r" 'set-rectangular-region-anchor
   "C-S-<mouse-1>" 'mc/add-cursor-on-click))


(after! company
  (setq-default company-dabbrev-other-buffers 'all
                company-tooltip-align-annotations t))


(use-package! org-page
  :config
  (setq op/repository-directory "~/Develop/sources/own/lampze.github.io/"
        op/repository-org-branch "source"
        op/repository-html-branch "master"
        op/theme-root-directory "/home/shirui/.emacs.d/.local/straight/repos/org-page/themes"
        op/load-directory "/home/shirui/.emacs.d/.local/straight/repos/org-page/"
        op/personal-github-link "https://github.com/lampze/"
        op/site-domain "https://lampze.github.io/"))


(when (featurep! :ui pretty-code)
  (set-pretty-symbols! 'scheme-mode
    :lambda "lambda"))

(set-company-backend! 'scheme-mode '(:separate company-dabbrev-code
                                               company-scheme))

(use-package! eaf
  :custom
  (eaf-find-alternate-file-in-dired t)
  :config
  (eaf-bind-key scroll_up "RET" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_down_page "DEL" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
  (eaf-bind-key take_photo "p" eaf-camera-keybinding))


(use-package! snails
  :bind (("C-x C-b" . snails)
         ("C-x M-b" . snails-search-point))
  :config
  ;; (set-face-attribute 'snails-content-buffer-face nil :height 240)
  )


(use-package fuz
  :defer t
  :init
  (defun load-fuz ()
    "Load fuz.el."
    (require 'fuz)
    (unless (require 'fuz-core nil t)
      (fuz-build-and-load-dymod)))
  :hook ((after-init . load-fuz))
  )


(use-package! graphviz-dot-mode
  :config
  (set-company-backend! 'graphviz-dot-mode '(company-graphviz-dot-backend))
  (setq graphviz-dot-indent-width 4)
  )


(use-package! nov
  :init
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode)))


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
(remove-hook 'text-mode-hook 'auto-fill-mode)


(+global-word-wrap-mode +1)


(toggle-frame-maximized)
