;;;  -*- lexical-binding: t; -*-

(after! company
  (setq-default company-dabbrev-other-buffers 'all
                company-tooltip-align-annotations t))

(map! (:after evil
        (:map evil-emacs-state-map
          "M-/" 'company-complete))
      (:after company
        (:map company-active-map
          "M-/" 'company-select-next)))
