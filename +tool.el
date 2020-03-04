;;; ~/.doom.d/+tool.el -*- lexical-binding: t; -*-

(defun append-after (list find atom)
  (cond ((eq list nil) nil)
        ((eq (car list) find) (cons atom list))
        (t (cons (car list) (append-after (cdr list) find atom)))))

(defun insert-hook (hook find function)
  (or (boundp hook) (set hook nil))
  (or (default-boundp hook) (set-default hook nil))
  (let ((hook-value (default-value hook)))
    ;; If the hook value is a single function, turn it into a list.
    (when (or (not (listp hook-value)) (functionp hook-value))
      (setq hook-value (list hook-value)))
    ;; Do the actual addition if necessary
    (unless (member function hook-value)
      (when (stringp function)
        (setq function (purecopy function)))
      (setq hook-value
            (append-after hook-value find function)))
    ;; Set the actual variable
    (set-default hook hook-value)))

(defun enable-format-on-save-now ()
  (interactive)
  (+format|enable-on-save))
