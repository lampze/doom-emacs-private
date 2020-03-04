;;; ~/.doom.d/+org-page.el -*- lexical-binding: t; -*-

(def-package! org-page
  :config
  (setq op/repository-directory "~/codehome/lampze.github.io"
        op/repository-org-branch "source"
        op/repository-html-branch "master"
        op/theme-root-directory "/home/shirui/.emacs.d/.local/straight/repos/org-page/themes"
        op/load-directory "/home/shirui/.emacs.d/.local/straight/repos/org-page/"
        op/personal-github-link "https://github.com/lampze/"
        op/site-domain "https://lampze.github.io/"))
