;; thereafter use-package loads packages

;; This is only needed once, near the top of the file

(require 'package)
;;; Code:
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))


;;; experimental ----------------

;; location for backups
(setq backup-directory-alist '( ("." . "~/.emacs_saves")))

;;; ----
(use-package yasnippet
  :ensure t)
(yas-global-mode 1)
(use-package org
  :ensure t)

;; evil
(unless (package-installed-p 'evil)
  (package-install 'evil))
(use-package evil
  :ensure t
  :config
  (evil-mode 1))

;; TODO: jj is esc, return to normal mode
;;  (define-key evil-insert-state-map "jj" 'evil-normal-state)
  (define-key evil-normal-state-map ",w" 'save-buffer)

;; use-package
(use-package ess)


;; replace flymake with flycheck
(setq ess-use-flymake nil)
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))
  
(setq ess-style 'RStudio)

;; y/n   (not yes/no)
(setq use-short-answers t)

;; cut & past  - emacs reports an error with next line | could NOT get this to work.
;; (xclip-mode 1)

;; try simpleclip
(simpleclip-mode 1)

;; leaving?   don't ask to kill, just do it.
(setq confirm-kill-processes nil)

;; which-key
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; Evil 'state' colors (mode in vim)
(setq evil-mode-line-format nil                 ;; normal = black
      evil-insert-state-cursor '(bar "White")   ;; insert = thin bar
      evil-visual-state-cursor '(box "#F86155"));; visulal =  red 


;; text completion
(use-package company
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2)
  (add-hook 'after-init-hook 'global-company-mode))

(setq company-selection-wrap-around t
      company-tooltip-align-annotations t
      company-idle-delay 0.45
      company-minimum-prefix-length 3
      company-tooltip-limit 10)

;; should associate .qmd files with quarto-mode
;; AND  files such as .Rmd
(use-package quarto-mode
  :mode (("\\.Rmd" . poly-quarto-mode))
  )

;; M-x jump-to-register (SAME ^x r j)
;; registers (short-cuts to files)
(set-register ?i (cons 'file "~/.config/emacs/init.el"))
(set-register ?e (cons 'file "~/code/docs/tech_notes/280_emacs_notes.qmd"))
(set-register ?j (cons 'file "~/code/docs/jobs/310_job_notes.qmd"))
(set-register ?m (cons 'file "~/code/docs/health_notes/medical_notes.qmd"))
(set-register ?p (cons 'file "~/code/docs/tech_notes/810_pharmaverse_NOTES.qmd"))
(set-register ?q (cons 'file "~/code/docs/tech_notes/250_quarto_knitr_SCSS_NOTES.qmd"))
(set-register ?r (cons 'file "~/code/docs/tech_notes/310_R_notes.qmd"))
(set-register ?t (cons 'file "~/code/docs/tech_notes/300_tech_notes.qmd"))

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

;; log my commands = ERRPRS
(use-package command-log-mode)

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
   '(simpleclip xclip paredit vertico magit exwm ess-r-insert-obj yaml-mode org-modern markdown-preview-mode yasnippet-snippets quarto-mode flycheck which-key yasnippet ess-smart-underscore use-package-ensure-system-package evil ess company))
 '(x-select-enable-clipboard-manager t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; CLAIM:  in R,  finds the repl (minor mode) buffer, empties it
(defun my-r-clear-buffer ()
  (interactive)
  (let ((r-repl-buffer (seq-find (lambda (buf)
                                   (string-prefix-p "*R" (buffer-name buf)))
                                 (buffer-list))))
    (if r-repl-buffer
        (with-current-buffer r-repl-buffer
          (comint-clear-buffer))
      (user-error "No R REPL buffers found"))))

; To Use (in R)
(global-set-key (kbd "C-c l") #'my-r-clear-buffer)

;; ^C. = go other window;   ^C, = return  [Hold ctrl key, press ,]

(global-set-key (kbd "C-.") #'other-window)
(global-set-key (kbd "C-,") #'prev-window)

(defun prev-window ()
  (interactive)
  (other-window -1))

;; short-cuts
;; (use-package dired
;;   ;; built-in don't install !
;;   :ensure nil
;;   :commands (dired dired-jump)
;;   :bind (("C-x C-j" . dired-jump))
;;   :custom ((dired-listing-switches "-agho --group-directories-first"))
;;   :config
;;   (evil-collection-define-key 'normal 'dired-mode-map
;;     "h" 'dired-single-up-directory
;;     "l" 'dired-single-buffer))

;;(use-package ess-smart-underscore
;;  :ensure t
;; )

;; (define-key ess-r-mode-hook "_" #'ess-insert-assign)
;; (define-key inferior-ess-r-mode-hook "_" #'ess-insert-assign)

;; FUTURE

;; clipboard, use + register in Evil 
(setq x-select-enable-clipboard nil)


;; EXPERIMENT - magit

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)


