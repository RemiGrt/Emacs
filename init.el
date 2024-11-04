(require 'package)
;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;;(load-theme 'dracula t)

;; Reveal
(require 'org-re-reveal)

(setq org-re-reveal-root "file:///c:/git/Reveal/reveal.js")

;;(custom-set-variables
;; ;; custom-set-variables was added by Custom.
;; ;; If you edit it by hand, you could mess it up, so be careful.
;; ;; Your init file should contain only one such instance.
;; ;; If there is more than one, they won't work right.
;; '(ansi-color-faces-vector
;;   [default default default italic underline success warning error])
;; '(custom-enabled-themes '(tango-dark))
;; '(inhibit-startup-screen t)
;; '(package-selected-packages '(flyspell-correct htmlize)))
;;(custom-set-faces
;; ;; custom-set-faces was added by Custom.
;; ;; If you edit it by hand, you could mess it up, so be careful.
;; ;; Your init file should contain only one such instance.
;; ;; If there is more than one, they won't work right.
;; '(default ((t (:family "Courier New" :foundry "outline" :slant normal :weight normal :height 120 :width normal)))))
;;;; Org Mode
;;(require 'org)
;;(define-key global-map "\C-cl" 'org-store-link)
;;(define-key global-map "\C-ca" 'org-agenda)
;;(setq org-log-done t)
;;
;;;; Set the package installation directory so that packages aren't stored in the
;;;; ~/.emacs.d/elpa path.
;;(require 'package)
;;(setq package-user-dir (expand-file-name "./.packages"))
;;(setq package-archives '(("melpa" . "https://melpa.org/packages/")
;;                         ("elpa" . "https://elpa.gnu.org/packages/")))
;;
;;;; Initialize the package system
;;(package-initialize)
;;(unless package-archive-contents
;;  (package-refresh-contents))
;;
;;;; Install dependencies
;;(package-install 'htmlize)
;;
;;(set-language-environment "UTF-8")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-safe-remote-resources '("\\`https://fniessen\\.github\\.io\\(?:/\\|\\'\\)"))
 '(package-selected-packages
   '(org-epa-gpg org-roam company ggtags org-re-reveal dracula-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(add-hook 'window-setup-hook 'toggle-frame-maximized t)


(set-face-attribute 'default nil :font "consolas-12" )

(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))

(add-hook 'after-init-hook 'global-company-mode)
(put 'dired-find-alternate-file 'disabled nil)

(use-package org-roam
  :ensure t)


;; Encryption
(require 'epa-file)
(epa-file-enable)
(setq epa-file-select-keys nil) 


(use-package org-epa-gpg
  :ensure t
  :after epa-file
  :config (org-epa-gpg-enable))

;; calendar start on monday
(setq calendar-week-start-day 1)
;; Display Week
(setq calendar-intermonth-text
      '(propertize
        (format "%2d"
                (car
                 (calendar-iso-from-absolute
                  (calendar-absolute-from-gregorian (list month day year)))))
        'font-lock-face 'font-lock-warning-face))

(setq calendar-intermonth-header
      (propertize "Wk"                  ; or e.g. "KW" in Germany
                  'font-lock-face 'font-lock-keyword-face))
