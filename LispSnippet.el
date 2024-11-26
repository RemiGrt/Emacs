(message user-emacs-directory)

(defun rg-load-init()
"Fonction chargeant le fichier de ini.el"
(interactive)
  (load-file (concat user-emacs-directory "init.el")))

(get-buffer-create "Remi")
(defun rg-write-buffer(filename)
" Give some infos"
(interactive "fFile name: ")
(with-current-buffer "Remi"
  (goto-char (point-max))
  (insert "Hello World " ))))

(defun rg-echo-current-buffer-filename (f)
    (interactive (list (buffer-file-name)))
;;    (message "Current buffer filename is %s" f)
    (message "bla " ))

(defun rg-select-file (filename)
  (interactive "fFile name: ")
  (switch-to-buffer (find-file-noselect filename))
  )

(defun rg-process-file (filename)
  (interactive  "fFile name: ")
  (remi-select-file filename)
  (setq firstword (buffer-substring 0 2))
  (setq info (list (count-lines-page) "blabla" firstword))
  (message "%S" info)
  )

(defun rg-select-current-line ()
"Select the current line"
(interactive)
(let ((pos (line-beginning-position)))
(end-of-line)
(set-mark pos))
)

(defun rg-select-current-word ()
"Select the word under cursor.
“word” here is considered any alphanumeric sequence with “_” or “-”."
(interactive)
(let (pt)
(skip-chars-backward "-_A-Za-z0-9")
(setq pt (point))
(skip-chars-forward "-_A-Za-z0-9")
(set-mark pt)))

(let ((buff (find-file-noselect "./sample.txt")))
  (with-current-buffer buff
    (goto-char (point-min))
    (insert "blablba\n")
    (goto-char (point-max))
    (insert "blablba\n")
    (save-buffer))
  (kill-buffer buff))

(defun rg-occurence ()
  "Display occurence of current word"
  (interactive)
  (setq myreg (current-word))
  (message "%s: %s" myreg (how-many myreg)))

(defun rg-flush ()
  "Display occurence of current word"
  (interactive)
  (setq myreg (current-word))
  (flush-lines myreg))

(defun rg-create-term ()
  " Create term"
  (interactive)
  (split-window-right)
  (windmove-right)
  (term "/bin/bash"))
