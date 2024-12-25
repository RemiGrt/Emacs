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

(rg-buff2matrix "./distance.txt");; [[13432 99527] [85422 64009] [79131 11256] [27674 82211] [65599 57936] [12692 67107] [29421 44641] [48876 12545] [62591 59319] [16202 93012] [79559 55075] [94998 31881] ...]


