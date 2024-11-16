;;
;; calendar start on monday
;;
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

;;
;; WindMove
;;
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)  
(global-set-key (kbd "C-c <down>")  'windmove-down)

;; resize buffer
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(setq user-mail-address "remi.griot@gmail.com")

;;
;; StartUp Windows
;; Backup Files
;;
(setq inhibit-startup-screen t)
(add-hook 'window-setup-hook 'toggle-frame-maximized t)
(setq backup-directory-alist '(("." . "~/.emacs.d/backup")))
;; display column and line
(setq line-number-mode t)
(setq column-number-mode t)
(tool-bar-mode -1)

;;
;; Dired
;;
(put 'dired-find-alternate-file 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(multiple-cursors magit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;
  ;; Shell
  ;;
(use-package eterm-256color
  :hook (term-mode . eterm-256color-mode))

;;
;; Multiple Cursor test 0
;; M-x package-install multiple-cursors
;; https://github.com/magnars/multiple-cursors.el
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; 
;; Automatically tangle our  config file when we save it test
;;
    (defun efs/org-babel-tangle-config ()
      (when (string-equal (buffer-file-name)
			  (expand-file-name "./init.el"))
	;; Dynamic scoping to the rescue
	(let ((org-confirm-babel-evaluate nil))
	  (org-babel-tangle))))
    (add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'efs/org-babel-tangle-config)))

;;
;; Magit
;;
(use-package magit
  :ensure t)

;;
  ;; Mardown
  ;;
(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

;;
  ;; Tcl Mode for some files
  ;;
(setq auto-mode-alist (cons '("\\.tcl$" . tcl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.do$" . tcl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.qsf$" . tcl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.sdc$" . tcl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.xdc$" . tcl-mode) auto-mode-alist))

;;
;; 
;;
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
