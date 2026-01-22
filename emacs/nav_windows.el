(message "I got this: %s" '(one two three)) 


;; ^C. = go other window;   ^C, = return  [Hold ctrl key, press ,]
(global-set-key (kbd "C-.") #'other-window)
(global-set-key (kbd "C-,") #'prev-window)

(buffer-file-name)

