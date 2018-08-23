;; -*- no-byte-compile: t; -*-

(package! paredit)
(package! multiple-cursors)

(when (featurep! :completion company)
  (package! company-scheme :recipe (:fetcher github :repo "lampze/company-scheme")))

(package! aweshell :recipe (:fetcher github :repo "manateelazycat/aweshell" :files ("*")))
