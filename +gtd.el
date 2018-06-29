;;;  -*- lexical-binding: t; -*-

(map!
 "C-c c" (lambda! (org-capture))
 "C-c C-c" (lambda! (require 'org-capture) (call-interactively 'org-capture-goto-target)))

(setq org-capture-templates nil
      org-default-notes-file "~/org/inbox.org")

(add-to-list 'org-capture-templates
             '("j" "Journal" entry
               (file+datetree "~/org/journal.org")
               "* %U - %^{heading}\n  %?"))

(add-to-list 'org-capture-templates
             '("i" "Inbox" entry (file "~/org/inbox.org")
               "* %U - %^{heading} %^g\n %?\n"))

(add-to-list 'org-capture-templates
             '("n" "Notes" entry (file "~/org/notes/inbox.org")
               "* %^{heading} %t %^g\n  %?\n"))

(add-to-list 'org-capture-templates
             '("t" "Todo" entry
               (file+headline "~/org/task.org" "Tasks")
               "* TODO %?\n%u\n" :clock-in t :clock-resume t))

