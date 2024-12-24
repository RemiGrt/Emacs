(let ((distvector ;;(with-temp-buffer
	     (progn (insert "[[")
		    (insert-file-contents "./distance.txt")
		    (while (re-search-forward "^" nil t)
		      (replace-match "[" nil t))
		    (while (re-search-forward "$" nil t)
		      (replace-match "]" nil t))
		    (end-of-buffer)
		    (insert "]]")
		    (goto-char 0))
	     (read (current-buffer))))
     ;; )
      distvector
      )
(defun rg-buff2matrix (filename)
  (let ((vect
	 (with-temp-buffer
	   (progn
	     (insert "(4 5)")
	     ;;(goto-char 0)
	   )
	   ))
	(read (current-buffer))
	)
   vect
    )
  )

(rg-buff2matrix "./distance.txt") 

(defun rg-buff2matrix (filename)
(let ((matrice
       (with-temp-buffer (progn
			   
			   (insert "[\n")
			   (insert-file-contents filename)
			   (beginning-of-buffer)
			   (while (re-search-forward "^[0-9]" nil t)
			     (backward-char)
			     (insert "[")
			     )
			   (beginning-of-buffer)
			   (while (re-search-forward "[0-9]$" nil t)
			     (insert "]"))
			   (end-of-buffer)
			   (insert "\n]")
			   (beginning-of-buffer)
			   )
			 (read (current-buffer))
			 )
       ))
  matrice
  )
)

(rg-buff2matrix "./distance.txt")


