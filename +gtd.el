;;;  -*- lexical-binding: t; -*-

(map!
 "C-c c" (lambda! (org-capture))
 "C-c C" (lambda! (require 'org-capture) (call-interactively 'org-capture-goto-target))
 (:after org
   (:map org-mode-map
     "C-c C-." 'org-time-stamp-inactive)))
