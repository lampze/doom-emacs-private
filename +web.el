;;;  -*- lexical-binding: t; -*-

(after! web-mode
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
        ))

(after! js2-mode
  (setq js-indent-level 2
        tern-command '("tern" "--no-port-file")
        ))

(map!
 (:after web-mode
   (:map web-mode-map
     "C-c C-v" 'browse-url-of-buffer))
 (:after emmet-mode
   (:map emmet-mode-keymap
     "C-j" 'emmet-expand-line)))
