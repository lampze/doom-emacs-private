;;; ~/.doom.d/+org-page.el -*- lexical-binding: t; -*-

(def-package! org-page
  :config
  (setq op/repository-directory "~/codehome/blog/"
        op/repository-org-branch "source"
        op/repository-html-branch "gh-pages"
        op/personal-github-link "https://github.com/lampze"
        op/site-domain "https://lampze.github.io/"))
