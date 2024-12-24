;; Enable Company
;; Check path to input file (find-file "./distance.txt")


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

(setq matrice (rg-buff2matrix "./distance.txt"))

(aref (aref matrice 0) 0) ;;13432
(aref (aref matrice 1) 0) ;; 85422
(length matrice);;1000
(sort matrice '<);;




(let ((distvector(with-temp-buffer
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
      (dist1 '())
      (dist2 '())
      (result '())
      (index 0)
      )
  (dotimes (ival (/ (length distvector) 2))
    (add-to-list 'dist1 (aref distvector index) t)
    (add-to-list 'dist2 (aref distvector (+ index 1)) t)
    (setq index (+ index 2))
    )
  (sort dist1 '<) ;;
  (sort dist2 '<) ;;
  (length dist1);;
  (length dist2);;
 ;; (dotimes (index (length dist1))
    (add-to-list 'result (+ (pop dist1) (pop dist2)) t)
 ;;   )
    ;; result
    distvector
  );;



(insert-file-contents "./distance.txt")




