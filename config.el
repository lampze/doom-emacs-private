;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "shirui"
      user-mail-address "1229408499@qq.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!
(setq doom-font (font-spec :family "iosevka" :size 40)
      doom-variable-pitch-font (font-spec :family "iosevka" :size 40)
      ;; doom-big-font (font-spec :family "iosevka" :size 30)
      ;; doom-symbol-font (font-spec :family "WenQuanYi Micro Hei Mono" :size 26)
      ;; doom-serif-font (font-spec :family "WenQuanYi Micro Hei Mono" :size 26)
      )

;; Set font for chinese characters
;; Font should be twice the width of asci chars so that org tables align
;; This will break if run in terminal mode, so use conditional to only run for GUI.
(defun my-cjk-font()
  (if (display-graphic-p)
      (dolist (charset '(kana han cjk-misc bopomofo))
        (set-fontset-font (frame-parameter nil 'font)
                          charset (font-spec :family "WenQuanYi Micro Hei Mono")))))

(add-hook 'after-setting-font-hook #'my-cjk-font)

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'modus-operandi)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/.org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq company-idle-delay 0.2
      frame-resize-pixelwise t
      markdown-command "pandoc"
      evil-default-state 'emacs
      nov-save-place-file "~/.config/emacs/.local/cache/nov-places"
      eaf-config-location "~/.config/emacs/.local/cache/eaf/"
      posframe-mouse-banish nil
      rmh-elfeed-org-files (list "~/.config/doom/elfeed.org")

      company-lsp-cache-candidates t
      company-lsp-async t
      company-lsp-enable-snippet t
      company-lsp-enable-recompletion t
      lsp-auto-guess-root t
      lsp-enable-snippet t
      lsp-auto-configure t
      lsp-file-watch-threshold 10000000
      lsp-signature-function 'lsp-signature-posframe

      default-input-method "rime"

      TeX-engine 'xetex

      org-log-done 'time

      ;; enable pylsp format
      lsp-pylsp-plugins-autopep8-enabled t

      read-aloud-engine "flite"

      vertico-posframe-parameters '((left-fringe . 8)
                                    (right-fringe . 8))

      org-latex-preview-numbered t

      lsp-volar-take-over-mode nil
      )

(setq-hook! 'python-mode-hook +format-with 'ruff)

(let ((pos (assoc 'dvisvgm org-latex-preview-process-alist)))
  (plist-put (cdr pos) :image-converter '("dvisvgm --page=1- --optimize --clipjoin --relative --no-fonts --bbox=preview -o %B-%%9p.svg %f")))


(set-email-account! "qq"
                    '((mu4e-sent-folder       . "/qq/Sent Mail")
                      (mu4e-drafts-folder     . "/qq/Drafts")
                      (mu4e-trash-folder      . "/qq/Trash")
                      (mu4e-refile-folder     . "/qq/All Mail")
                      (smtpmail-smtp-user     . "1229408499@qq.com")
                      (user-mail-address      . "1229408499@qq.com")    ;; only needed for mu < 1.4
                      (mu4e-compose-signature . "")
                      (smtpmail-starttls-credentials . '(("smtp.qq.com" 587 nil nil)))
                      (smtpmail-default-smtp-server . "smtp.qq.com")
                      (smtpmail-smtp-server . "smtp.qq.com")
                      )
                    t)
(auth-source-pass-enable)
(after! mu4e
  (setq mu4e-headers-fields '((:account-stripe . 1)
                              (:human-date . 14)
                              (:flags . 6)
                              (:from-or-to . 25)
                              (:subject)))
  )


(setq-default c-basic-offset 2
              tab-width 2
              web-mode-markup-indent-offset 2
              js-indent-level 2
              standard-indent 2)

(after! org-re-reveal
  (setq org-re-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js"))


(after! elfeed
  (setq elfeed-search-filter "@2-months-ago -arxiv -v2ex -game -hide"))


(map! (:map ivy-minibuffer-map
            "C-d" 'ivy-switch-buffer-kill)
      (:map org-mode-map
            "ESC <left>" 'org-metaleft))


;; web-mode setup
(define-derived-mode vue-mode web-mode "Vue")
(add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode))
(add-to-list 'exec-path "~/.local/bin")

(defun vue-eglot-init-options ()
  (let ((tsdk-path (expand-file-name
                    "lib"
                    (string-trim-right (shell-command-to-string "npm list --global --parseable typescript | head -n1")))))
    `(:typescript (:tsdk ,tsdk-path
                         ;; :languageFeatures (:completion
                         ;;                    (:defaultTagNameCase "both"
                         ;;                     :defaultAttrNameCase "kebabCase"
                         ;;                     :getDocumentNameCasesRequest nil
                         ;;                     :getDocumentSelectionRequest nil)
                         ;;                    :diagnostics
                         ;;                    (:getDocumentVersionRequest nil))
                         ;; :documentFeatures (:documentFormatting
                         ;;                    (:defaultPrintWidth 100
                         ;;                     :getDocumentPrintWidthRequest nil)
                         ;;                    :documentSymbol t
                         ;;                    :documentColor t)
                         )
      :vue (:hybridMode :json-false)
      )))

;; Volar
(set-eglot-client! 'vue-mode
                   `("vue-language-server" "--stdio"
                     :initializationOptions ,(vue-eglot-init-options)))
;; (set-eglot-client! 'vue-mode
;;                    `("typescript-language-server" "--stdio"
;;                      :initializationOptions (:plugins [(:name "@vue/typescript-plugin"
;;                                                         :location "/home/shirui/.local/lib64/node_modules/@vue/language-server"
;;                                                         :language ["vue"])]
;;                                                       :preferences (:interactiveInlayHints :json-false)
;;                                                       :tsserver (:logVerbosity "verbose"
;;                                                                  :trace "verbose"))))


(use-package! guess-word)


;; (use-package sqlite-mode-extras
;;   :bind (:map
;;          sqlite-mode-map
;;          ("n" . next-line)
;;          ("p" . previous-line)
;;          ("<backtab>" . sqlite-mode-extras-backtab-dwim)
;;          ("<tab>" . sqlite-mode-extras-tab-dwim)
;;          ("RET" . sqlite-mode-extras-ret-dwim)))


(use-package! zotxt
  :hook (org-mode . org-zotxt-mode))


;; (use-package! org-latex-impatient
;;   :defer t
;;   :hook (org-mode . org-latex-impatient-mode)
;;   :config
;;   (setq org-latex-impatient-scale 2.5)
;;   :init
;;   (setq org-latex-impatient-tex2svg-bin
;;         ;; location of tex2svg executable
;;         "~/.config/emacs/.local/etc/node/node_modules/mathjax-node-cli/bin/tex2svg"))


(defun lampze/pdm-get-venv-path (&optional dir)
  (let ((pdm-get-python-cmd "pdm venv --path in-project"))
    (car (split-string (string-trim
                        (shell-command-to-string
                         (if dir
                             (concat "cd "
                                     dir
                                     " && "
                                     pdm-get-python-cmd)
                           pdm-get-python-cmd ))) "\n"))))

;; (defun linw1995/pdm-get-packages-path (&optional dir)
;;   (let ((pdm-get-packages-cmd "pdm run bash -c 'printenv PEP582_PACKAGES'"))
;;     (concat (string-trim
;;              (shell-command-to-string
;;               (if dir
;;                   (concat "cd "
;;                           dir
;;                           " && "
;;                           pdm-get-packages-cmd)
;;                 pdm-get-packages-cmd)))
;;             "/lib")))

(defun lampze/pdm-project-p ()
  "Return true if in pdm project."
  (if (eq (with-temp-buffer (call-process "pdm" nil (current-buffer) nil "info"))
          0)
      t nil))

(defun lampze/pdm-activate ()
  (when (lampze/pdm-project-p)
    (pyvenv-activate (lampze/pdm-get-venv-path))))

(add-hook! 'python-mode-hook #'lampze/pdm-activate)

(use-package! go-translate
  :config
  (setq gt-langs '(en zh)
        gt-default-translator (gt-translator :engines (gt-youdao-dict-engine))))


(use-package! holo-layer
  :config
  (setq holo-layer-enable-cursor-animation t
        holo-layer-enable-place-info t
        holo-layer-cursor-alpha 100
        holo-layer-cursor-animation-interval 25
        holo-layer-cursor-animation-type "jelly easing"
        holo-layer-python-command "/usr/bin/python")
  (holo-layer-enable))


;; (use-package! lsp-pyright
;;   :ensure t
;;   :hook (python-mode . (lambda ()
;;                          (if (eq (shell-command "pdm info") 0)
;;                            (setq lsp-pyright-extra-paths (vector (linw1995/pdm-get-packages-path))
;;                                  lsp-pyright-venv-path (lampze/pdm-get-venv-path))
;;                            (setq lsp-pyright-extra-paths (vector)
;;                                  lsp-pyright-venv-path nil)))))


;; (use-package! org-fragtog
;;   :defer t
;;   :hook (org-mode .  org-fragtog-mode)
;;   :config
;;   (plist-put org-format-latex-options :scale 3.0))


(use-package! rime
  :config
  (setq rime-user-data-dir "~/.config/emacs/.local/etc/rime"
        rime-posframe-style 'vertical
        rime-show-candidate 'posframe)
  :custom
  (default-input-method "rime")
  (rime-emacs-module-header-root "/usr/include/emacs-29"))


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


(when (modulep! :ui pretty-code)
  (set-pretty-symbols! 'scheme-mode
    :lambda "lambda"))

(set-company-backend! 'scheme-mode '(:separate company-dabbrev-code
                                     company-scheme))

;; (use-package! eaf
;;   :custom
;;   (eaf-find-alternate-file-in-dired t)
;;   :config
;;   (eaf-bind-key scroll_up "RET" eaf-pdf-viewer-keybinding)
;;   (eaf-bind-key scroll_down_page "DEL" eaf-pdf-viewer-keybinding)
;;   (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
;;   (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
;;   (eaf-bind-key take_photo "p" eaf-camera-keybinding))


;; (use-package! snails
;;   :bind (("C-x C-b" . snails)
;;          ("C-x M-b" . snails-search-point))
;;   :config
;;   (require 'cl)
;;   ;; (set-face-attribute 'snails-content-buffer-face nil :height 240)
;;   )


;; (use-package fuz
;;   :defer t
;;   :init
;;   (defun load-fuz ()
;;     "Load fuz.el."
;;     (require 'fuz)
;;     (unless (require 'fuz-core nil t)
;;       (fuz-build-and-load-dymod)))
;;   :hook ((after-init . load-fuz))
;;   )


(use-package! graphviz-dot-mode
  :config
  (set-company-backend! 'graphviz-dot-mode '(company-graphviz-dot-backend))
  (setq graphviz-dot-indent-width 4)
  )


(use-package! nov
  :init
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
  )


;; org-static-blog config start
(setq org-static-blog-publish-title "lampze's Blog"
      org-static-blog-publish-url "https://lampze.github.io/"
      org-static-blog-publish-directory "~/Develop/sources/own/lampze.github.io/"
      org-static-blog-posts-directory "~/Develop/sources/own/lampze.github.io/posts/"
      org-static-blog-drafts-directory "~/Develop/sources/own/lampze.github.io/drafts/"
      org-export-with-toc nil
      org-export-with-section-numbers nil
      org-static-blog-index-length 6
      org-static-blog-enable-tags t
      org-static-blog-use-preview t
      org-static-blog-preview-link-p t
      org-static-blog-langcode "zh")

(setq org-static-blog-page-header
      "<meta  name=\"author\" content=\"lampze\" />
      <link href= \"/static/style.css\" rel=\"stylesheet\" type=\"text/css\" />
      <link href= \"/static/org.css\" rel=\"stylesheet\" type=\"text/css\" />
      <script src=\"https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js\"></script>
      <script type=\"text/javascript\" id=\"MathJax-script\" async
        src=\"https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js\"></script>
      <meta http-equiv=\"content-type\" content=\"application/xhtml+xml; charset=UTF-8\" />
      <meta name=\"viewport\" content=\"initial-scale=1,width=device-width,minimum-scale=1\">")

(setq org-static-blog-page-preamble
      "<div class=\"header\">
        <a href=\"https://lampze.github.io\">lampze's Blog</a>
      </div>")

(setq org-static-blog-page-postamble
      "<center>
         <a rel=\"license\" href=\"https://creativecommons.org/licenses/by-sa/3.0/\"></a><br />
         <span xmlns:dct=\"https://purl.org/dc/terms/\"
               href=\"https://purl.org/dc/dcmitype/Text\"
               property=\"dct:title\"
               rel=\"dct:type\">
           https://lampze.github.io
         </span>
         by
         <a xmlns:cc=\"https://creativecommons.org/ns#\"
              href=\"https://lampze.github.io\"
              property=\"cc:attributionName\"
              rel=\"cc:attributionURL\">
           lampze
         </a>
         is licensed under a
         <a rel=\"license\"
            href=\"https://creativecommons.org/licenses/by-sa/3.0/\">
           Creative Commons Attribution-ShareAlike 3.0 Unported License
         </a>.
       </center>
       <script type=\"text/javascript\" src=\"/static/main.js\"></script>")
;; org-static-blog config end


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


(when (not (modulep! :ui doom-quit))
  (setq confirm-kill-emacs nil))


;; disable org-mode's auto wrap
(remove-hook 'org-mode-hook 'auto-fill-mode)
(remove-hook 'text-mode-hook 'auto-fill-mode)

;; (+global-word-wrap-mode +1)


(set-company-backend! 'org-mode
                      '(:separate  company-math-symbols-latex company-latex-commands))

(defun daviwil/org-roam-filter-by-tag (tag-name)
  (lambda (node)
    (member tag-name (org-roam-node-tags node))))

(defun daviwil/org-roam-list-notes-by-tag (tag-name)
  (mapcar #'org-roam-node-file
          (seq-filter
           (daviwil/org-roam-filter-by-tag tag-name)
           (org-roam-node-list))))

(defun daviwil/org-roam-refresh-agenda-list ()
  (interactive)
  (setq org-agenda-files (daviwil/org-roam-list-notes-by-tag "Agenda")))

(defun lampze/org-publish-refresh-project-alist ()
  (interactive)
  (setq org-publish-project-alist
        `(("blog"
           :base-directory "~/.org/roam"
           :exclude ".*"
           :include ,(mapcar (lambda (x) (string-remove-prefix org-roam-directory x))
                             (daviwil/org-roam-list-notes-by-tag "Blog"))
           :publishing-function org-html-publish-to-html
           :publishing-directory "~/.blog/"
           :section-numbers nil
           :recursive t
           :language "zh"
           :preserve-breaks t
           :headline-levels 3
           :html-doctype "html5"
           :html-html5-fancy t
           :html-head
           "<link rel=\"stylesheet\" href=\"/static/style.css\" type=\"text/css\"/>
            <link rel=\"stylesheet\" href=\"/static/org.css\" type=\"text/css\"/>
            <script src=\"https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js\"></script>
            <meta http-equiv=\"content-type\" content=\"application/xhtml+xml; charset=UTF-8\" />
            <meta name=\"viewport\" content=\"initial-scale=1,width=device-width,minimum-scale=1\">"
           :html-preamble
           "<div class=\"header\">
            <a href=\"https://lampze.github.io\">lampze's Blog</a>
            <span id=\"post-date\" style=\"float: right\">%d</span>
            </div>"
           :html-postamble
           "<script type=\"text/javascript\" src=\"/static/main.js\"></script>
            <center id=\"modi-date\">%T</center>"
           :auto-sitemap t
           :sitemap-title "我的文章"
           :sitemap-filename "index.org"
           :sitemap-sort-files anti-chronologically
           :sitemap-format-entry (lambda (entry style project)
                                   (cond ((not (directory-name-p entry))
	                                  (format "<%s> [[file:%s][%s]]"
                                                  (format-time-string
                                                   "%Y-%m-%d"
                                                   (org-publish-find-date entry project))
		                                  entry
		                                  (org-publish-find-title entry project)))
	                                 ((eq style 'tree)
	                                  ;; Return only last subdir.
	                                  (file-name-nondirectory (directory-file-name entry)))
	                                 (t entry)))
           ))))

(daviwil/org-roam-refresh-agenda-list)
(lampze/org-publish-refresh-project-alist)

(pixel-scroll-precision-mode)
