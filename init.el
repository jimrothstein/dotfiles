
;; a macro  aids config of packages.

;; thereafter use-package loads packages

;; This is only needed once, near the top of the file

(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

;; FUTURE
;(org-babel-load-file "path/to/this/file.org")

; switches:
;(global-visual-line-mode +1)    turn on
; (tool-bar-mode -1)   ;; toggle on/off


;;(add-to-list 'package-archives '("melpa" . "http://stable.melpa.org/packages/"))



(use-package org
  :ensure t)

(unless (package-installed-p 'evil)
  (package-install 'evil))

(use-package evil
  :ensure t
  :config
  (evil-mode 1))
;; jj is esc, return to normal mode
;;
;;  (define-key evil-insert-state-map "jj" 'evil-normal-state)
  (define-key evil-normal-state-map ",w" 'save-buffer)

;;
                         
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-always-ensure t)

(use-package ess)

;; single underscore becomes <- (I want to change to double underscore)
;; (use-package ess-smart-underscore)

(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(setq company-selection-wrap-around t
      company-tooltip-align-annotations t
      company-idle-delay 0.45
      company-minimum-prefix-length 3
      company-tooltip-limit 10)


;;  always follow symlinks to actual file (and don't ask)
(setq vc-follow-symlinks t)
;; no backup files
(setq make-backup-files nil)

;;  line numbers
(global-display-line-numbers-mode 1)
;; now relative
(setq display-line-numbers-type 'relative)

;; global parathesis matching
(show-paren-mode)

;; font-lock highlight
(setq ess-R-font-lock-keywords
      '((ess-fl-keyword:fun-calls . t)))

;; org mode


(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
 
;(org-babel-load-file "path/to/this/file.org")


;; kbd macro make_section (separate with -----)
;; M-x make_section  (to run)
(fset 'make_section
   (kmacro-lambda-form [?k ?i ?# ?  ?- ?- ?- ?- ?- ?- ?- escape ?y ?y ?j ?j ?k ?p ?o escape] 0 "%d"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(ess-smart-underscore use-package-ensure-system-package evil ess company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; CLAIM:  in R,  finds the repl buffer, empties it
(defun my-r-clear-buffer ()
  (interactive)
  (let ((r-repl-buffer (seq-find (lambda (buf)
                                   (string-prefix-p "*R" (buffer-name buf)))
                                 (buffer-list))))
    (if r-repl-buffer
        (with-current-buffer r-repl-buffer
          (comint-clear-buffer))
      (user-error "No R REPL buffers found"))))

(global-set-key (kbd "C-c l") #'my-r-clear-buffer)
