;;;  -*- lexical-binding: t; -*-

(after! company
  (setq-default company-dabbrev-other-buffers 'all
                company-tooltip-align-annotations t))

(map!
 (:after company
   (:map company-mode-map
     "M-/" 'company-complete)
   (:map company-active-map
     "M-/" 'company-select-next
     "C-n" 'company-select-next
     "C-p" 'company-select-previous)))