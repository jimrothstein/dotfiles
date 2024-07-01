## experimental.el

(add-hook 'find-file-hook 'my-r-style-hook)
defun my-r-style-hook ()
  (when (string-match (file-name-extension buffer-file-name) "[r|R]$")
    (ess-set-style 'RStudio)))
