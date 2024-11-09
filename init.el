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

;;
;; StartUp Windows
;; Backup Files
;;
(setq inhibit-startup-screen t)
(add-hook 'window-setup-hook 'toggle-frame-maximized t)
(setq backup-directory-alist '(("." . "~/.emacs.d/backup")))

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



;;
;; Multiple Cursor
;; M-x package-install multiple-cursors
;; https://github.com/magnars/multiple-cursors.el
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


;;
;; Dired
;; C-x C-q Rend le buffer editable
;; C-c C-c Apllique les changements
;; j jump to file
;; ^ parent folder


