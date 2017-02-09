;; Date shortcut.
(defun insert-date (prefix)
  "Insert the current date. With prefix-argument, use ISO format. With
   two prefix arguments, write out the day and month name."
  (interactive "P")
  (let ((format (cond
                 ((not prefix) "%Y-%m-%d")                ;; C-c d
                 ((equal prefix '(4)) "%d.%m.%Y")         ;; C-u C-c d
                 ((equal prefix '(16)) "%A, %d. %B %Y"))) ;; C-u C-u C-c d
        (system-time-locale "en_US"))
    (insert (format-time-string format))))
