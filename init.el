
(require 'package)
(require 'use-package)


(package-initialize)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://stable.melpa.org/packages/"))

(use-package org
  :ensure t)

(unless (package-installed-p 'evil)
  (package-install 'evil))

(use-package evil
  :ensure t
  :config
  (evil-mode 1))


                         
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-always-ensure t)

(use-package ess)

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

;;  line numbers
(global-display-line-numbers-mode 1)
;; now relative
(setq display-line-numbers-type 'relative)

