;;;  -*- lexical-binding: t; -*-

(map!
 "C-c c" (lambda! (org-capture))
 "C-c C" (lambda! (require 'org-capture) (call-interactively 'org-capture-goto-target))
 (:after org
   (:map org-mode-map
     "C-c C-." 'org-time-stamp-inactive)))

(setq org-capture-templates '(("i" "Inbox" entry
                               (file+headline "~/.gtd/inbox.org" "Inbox")
                               "* TODO %i%?\n%U")
                              ("t" "Task" entry
                               (file+headline "~/.gtd/inbox.org" "Tasks")
                               "* TODO %i%?\n%U")
                              ("s" "Study" entry
                               (file+headline "~/.gtd/inbox.org" "Study")
                               "* TODO %i%?\n%U")
                              ("S" "Someday" entry
                               (file+headline "~/.gtd/someday.org" "Someday")
                               "* TODO %i%?\n%U"))

      org-refile-targets '(("~/.gtd/gtd.org" :maxlevel . 3)
                           ("~/.gtd/someday.org" :level . 1)
                           ("~/.gtd/inbox.org" :level . 1)
                           (nil :level . 1)))
