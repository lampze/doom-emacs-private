;;;  -*- lexical-binding: t; -*-

(map!
 "C-c c" 'org-capture
 "C-c C" (λ! (require 'org-capture) (call-interactively 'org-capture-goto-target)))
