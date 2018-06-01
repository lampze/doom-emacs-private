;;; ~/.doom.d/+ivy.el -*- lexical-binding: t; -*-

(map!
 (:after ivy
   (:map ivy-minibuffer-map
     "C-d" 'ivy-switch-buffer-kill)))
