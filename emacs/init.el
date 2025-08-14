;; package -- summary: thereafter use-package loads packages  toggle whitespace mode on/off (now in init.el)

;;------------------------ setup

;; default package mgr:  `package`
;; ..  remove references to `straight` a newer, package mgr

;; (7/7/2025) consult removed;  having errors
;; use-package aids configuing packages; it uses built-in package mgr.

;; (6/24/2025) r 


(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
 (package-initialize)

;; "bootstrap"
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

(setq backup-directory-alist '( ("." . "~/.emacs_saves")))


;; global tab line  ON
(setq global-tab-line-mode t)

;; use spaces, not tabs; as default (esp good for yaml)
(setq-default indent-tabs-mode nil)

;; jump to other window (still need?)
(global-set-key [C-tab] 'other-window)
 
;;------------------------  ysasnippet
(use-package yasnippet
  :ensure t) ;; if not installed, use-package will do so
(yas-global-mode 1)
(use-package org
  :ensure t)
:;; ------------------------  evil
(unless (package-installed-p 'evil)
  (package-install 'evil))
(use-package evil
  :ensure t
  :config
  (evil-mode 1)) ; 1 = on,active

;; toggle evil/emacs
(setq evil-toggle-key "C-z")
(require 'evil) ;; evil must load 1st
;; Evil 'state' colors (mode in vim)

;; cursor colors
(setq evil-mode-line-format nil                 ;; normal = black
      evil-insert-state-cursor '(bar "White")   ;; insert = thin bar
      evil-visual-state-cursor '(box "#F86155"));; visual =  red 

;; normal cursor = purple
(setq evil-normal-state-cursor '(box "purple"))

;; insert cursor = bar, blue
(setq evil-insert-state-cursor '((bar . 5)  "green"))

;; ,w to save buffer
  (define-key evil-normal-state-map ",w" 'save-buffer)


;; ------------------------ indent-bars
(use-package indent-bars
  :hook ((yaml-mode) . indent-bars-mode)) ; or whichever modes you prefer

   (setq
    indent-bars-pattern "."
    indent-bars-width-frac 0.5
    indent-bars-pad-frac 0.25
    indent-bars-color-by-depth nil
    indent-bars-highlight-current-depth '(:face default :blend 0.4))

;; ------------------------ xclip board
;; (6/25) TODO: claim: obsolete, use select-enable-clipboard ... instead?
;; need BOTH this, and clipboard- commands ??? 

;; clipboard, use + register in Evil 
(setq x-select-enable-clipboard nil)

;;  cut & paste?   experiment (6/25)
(global-set-key "\C-w" 'clipboard-kill-region)
(global-set-key "\M-w" 'clipboard-kill-ring-save)
(global-set-key "\C-y" 'clipboard-yank)



;; ------------------------  ess (via gemini)
;; ess = package
;; ess-r-mode = major mode (from pkg ess)
;; my-start-r() = function
(use-package ess
  :ensure t ; Ensure ESS is installed if not already
  :config
  ;; Load the ess-site file (VERY IMPORTANT for proper ESS setup)
  (require 'ess-site)
  

  ;; Associate ESS with R and R Markdown/Quarto files
  ;; The order matters: Rmd/qmd before .R
  (add-to-list 'auto-mode-alist '("\\.qmd\\'" . Rmd-mode)) ; Quarto documents
  (add-to-list 'auto-mode-alist '("\\.Rmd\\'" . Rmd-mode)) ; R Markdown documents
  (add-to-list 'auto-mode-alist '("\\.[RrSs]\\'" . ess-r-mode)) ; .R and .S files

  ;; R-specific settings
  (setq
   ;; Args for R when starting ESS process (e.g., --no-save --no-restore)
   ess-R-args "--no-save --no-restore"
   ess-use-auto-completion t       ; auto-complete
   ess-indent-offset 2             ; Use 2 spaces for indentation
   ess-nuke-buffer-on-exit t       ; Kill the ESS process buffer when done
   ess-eval-visibly-p nil          ; Don't show evaluation output in a separate buffer immediately
   ess-local-process-name "R"      ; Default process name for R
   ;; Prompt settings if you customize your R prompt
   ess-set-procs-buffer-regexp (rx bos (or "R " "r") "[>+] ")
   ess-smart-S-assign-key (kbd "_") ; convert _ to <-
   ess-use-flycheck t              ; for linting
   )

  ;; WORK?
   (setq ess_style 'RStudio)

  ;; Define your custom function within the ESS config (ie :config)
  (defun my-start-r ()
    (interactive)
    (split-window-right) ; Splits the window to the right
    (R)                  ; Starts the R process
    (other-window 1))    ; Switches back to the original window (your script)

  ;; Keybindings for ESS (ess-r-mode)
  ;; We use `with-eval-after-load 'ess-r-mode'` to ensure ess-r-mode-map is defined
  (with-eval-after-load 'ess-r-mode
    (define-key ess-r-mode-map (kbd "C-c r") 'my-start-r) ; Your custom keybinding
    (define-key ess-r-mode-map (kbd "C-c C-e") 'ess-eval-line-and-step)
    (define-key ess-r-mode-map (kbd "C-c C-c") 'ess-eval-buffer)
    (define-key ess-r-mode-map (kbd "C-c C-r") 'ess-eval-region)
    (define-key ess-r-mode-map (kbd "C-c C-z") 'ess-switch-to-ESS)
    (define-key ess-r-mode-map (kbd "C-c C-s") 'ess-load-file)
    (define-key ess-r-mode-map (kbd "C-c C-k") 'ess-kill-buffer-and-process)
  )

  ;; Hooks for Rmd mode
  (with-eval-after-load 'Rmd-mode
    (define-key Rmd-mode-map (kbd "C-c C-v") 'poly-R-chunk-eval))
)

;; ------------------------  flycheck
;; replace flymake with flycheck
(setq ess-use-flymake nil)
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))
  

;; ------------------------ YAML

;; (define-key apply-yaml (kbd "C-y") 'yaml-mode)

;; use package yaml-mode - NOTHING
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yaml\\'".yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yml\\'".yaml-mode))
;;
(add-hook 'yaml-mode-hook
	 #'(lambda ()
	    (define-key yaml-mode-map (kbd "RET") 'newline-and-indent)))

(setq yaml-indent-offset 2)
;; ------------------------  whitespace-mode (till I get yaml working?)

;;  toggle whitespace mode on/off (now in init.el)
(require 'bind-key)
(bind-key* "C-w" 'whitespace-mode)

;; another way?
(global-set-key "\C-cw" 'whitespace-mode)
;; ------------------------  misc params

;; y/n   (not yes/no)
(setq use-short-answers t)

;; display column number
(setq column-number-mode t) 

;; leaving?   don't ask to kill, just do it.
(setq confirm-kill-processes nil)

;; ------------------------ which-key
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; Evil 'state' colors (mode in vim)
(setq evil-mode-line-format nil                 ;; normal = black
      evil-insert-state-cursor '(bar "White")   ;; insert = thin bar
      evil-visual-state-cursor '(box "#F86155"));; visulal =  red 

;; ------------------------ company (text completion)
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

;;------------------------  quarto
;; should auto ssociate .qmd files with quarto-mode
;; for files such as .Rmd
(require 'quarto-mode)

(use-package quarto-mode
  :mode (("\\.Rmd" . poly-quarto-mode))
  :mode (("\\.qmd" . poly-quarto-mode))
  )

;;------------------------  shortcut use registers
;; M-x jump-to-register (SAME ^x r j)
;; registers (short-cuts to files)
(set-register ?a (cons 'file "~/.config/zsh/aliases.zsh"))
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

;; relative line numbers
(setq display-line-numbers-type 'relative)

;; global parathesis matching
(show-paren-mode)

;; font-lock highlight
(setq ess-R-font-lock-keywords
      '((ess-fl-keyword:fun-calls . t)))

;; log my commands = ERRPRS
(use-package command-log-mode)

;;------------------------  org mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; allow bash to run in org mode blocks
 (org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (shell . t)
   ;; Add other languages as needed
   ))


;; ------------------------  custom - why?

;; lists all user installed pacakges?
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(## company ess ess-r-insert-obj ess-r-mode ess-smart-underscore evil
	evil-collection exwm flycheck gptel indent-bars magit
	markdown-preview-mode org-modern paredit quarto-mode
	racket-mode request-deferred simpleclip
	use-package-ensure-system-package vertico which-key
	whitespace-cleanup-mode whitespace-mode xclip yaml-mode
	yasnippet yasnippet-snippets))
 '(x-select-enable-clipboard-manager t))
;; ------------------------  

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; ^C. = go other window;   ^C, = return  [Hold ctrl key, press ,]
(global-set-key (kbd "C-.") #'other-window)
(global-set-key (kbd "C-,") #'prev-window)

(defun prev-window ()
  (interactive)
  (other-window -1))

;; FUTURE


;;------------------------  experiments (at bottom)

;; ------------------------  evil cursor fonts

;; USE:  M-x shell
;; opens shell in SAME window, not new one (default)
(setq display-buffer-alist '(("\\*shell" (display-buffer-same-window))))

;; (April 2025) 
(setq display-buffer-alist
      '(("*R Dired"
         (display-buffer-reuse-window display-buffer-at-bottom)
         (window-width . 0.5)
         (window-height 0.25)
         (reusable-frames . nil))
        ("*R"
         (display-buffer-reuse-window display-buffer-in-side-window)
         (side . right)
         (slot . -1) ;; left 1/3
         (window-width . 0.5)
         (reusable-frames . nil))
        ("^\\*Help"
         (display-buffer-reuse-window display-buffer-in-side-window)
         (side . right)
         (slot . 1) ;; right 1/3
         (window-width . 0.5)
         (reusable-frames . nil))))

;; (4/25) modern completion
;;
;;(use-package vertico
  ;; :ensure t


;; ------------------------  consult
;; removed july 7, 2025
;; see consult.el
;; ------------------------  separate


;; ------------------------  LEGACY, WHAT is needed?

;; ------------------------ ESS 
;; M-x ess-version = 20240821 

;; ------------------------  R
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

; ESS, R clear console (console MUST have focus)
(global-set-key (kbd "C-l") 'comint-clear-buffer) ; clear R console/process buffer

; ESS, R  use <-
(eval-after-load "ess-mode" '(define-key ess-mode-map (kbd "C-_") " <- "))
(eval-after-load "ess-mode" '(define-key inferior-ess-mode-map (kbd "C-_") " <- "))

