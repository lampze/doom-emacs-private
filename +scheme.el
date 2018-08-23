;;; ~/.doom.d/+scheme.el -*- lexical-binding: t; -*-

(when (featurep! :ui pretty-code)
  (set-pretty-symbols! 'scheme-mode
    :lambda "lambda"))

(set-company-backend! 'scheme-mode '(:separate company-dabbrev-code
                                               company-scheme))
