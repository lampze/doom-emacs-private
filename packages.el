;; -*- no-byte-compile: t; -*-

(package! paredit)
(package! multiple-cursors)
(package! move-text)
(package! org-page)

(when (featurep! :completion company)
  (package! company-scheme :recipe (:host github
                                          :repo "lampze/company-scheme")))

(package! aweshell :recipe (:host github
                                  :repo "manateelazycat/aweshell"
                                  :files ("*")))

(package! snalis :recipe (:host github
                                :repo "manateelazycat/snails"
                                :no-byte-compile t))

(package! eaf :recipe (:host github
                             :repo "manateelazycat/emacs-application-framework"
                             :files ("*")))
