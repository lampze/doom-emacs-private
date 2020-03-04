;;;  -*- lexical-binding: t; -*-

(setq company-lsp-cache-candidates t
      company-lsp-async t
      company-lsp-enable-snippet t
      company-lsp-enable-recompletion t
      lsp-auto-guess-root t
      lsp-enable-snippet t
      lsp-auto-configure t
      lsp-file-watch-threshold 10000000
      )

(after! company
  (setq-default company-dabbrev-other-buffers 'all
                company-tooltip-align-annotations t))

(map! (:after evil
        (:map evil-emacs-state-map
          "M-/" 'company-complete))
      (:after company
        "M-/" 'company-complete
        (:map company-active-map
          "M-/" 'company-select-next))
      (:after web-mode
        (:map web-mode-map
         "M-/" 'company-complete)))
