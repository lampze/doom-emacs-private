;;;  -*- lexical-binding: t; -*-

(map!
 "C-c c" (lambda! (org-capture))
 "C-c C" (lambda! (require 'org-capture) (call-interactively 'org-capture-goto-target)))

(setq org-capture-templates '(("i" "Inbox" entry
                               (file+headline "~/.gtd/inbox.org" "Inbox")
                               "* TODO %i%?")
                              ("t" "Task" entry
                               (file+headline "~/.gtd/inbox.org" "Tasks")
                               "* TODO %i%?")
                              ("s" "Study" entry
                               (file+headline "~/.gtd/inbox.org" "Study")
                               "* TODO %i%?"))
      org-refile-targets '(("~/.gtd/gtd.org" :maxlevel . 3)
                           ("~/.gtd/someday.org" :level . 1)
                           ("~/.gtd/inbox.org" :level . 1)
                           (nil :level . 1)))
