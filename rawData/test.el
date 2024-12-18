(defun process-files (dir) 
  (mapc 'process-file
        (directory-files dir t ".txt$")))


(defun rg-list-reg-dir (dir)
  (interactive "Dfolder:") 
  (setq filelist (directory-files dir t ".txt$"))
  (dolist (p filelist)
    (rg-list-reg-value p "reg1"))
  )


(mapc 'rg-list-reg-value
      (directory-files "." t ".txt$")) 

(rg-list-reg-value "reg.txt" "reg1")

