;; Enable Company
;; Check path to input file (find-file "./distance.txt")

(let ((bob '(1 2
	     4  3))
      (bab '(4 5 6)))
  bob
  );;


(let ((distvector(with-temp-buffer
	     (progn (insert "[")
		    (insert-file-contents "./distance.txt")
		    (end-of-buffer)
		    (insert "]")
		    (goto-char 0))
	     (read (current-buffer))))
      (dist1 '())
      (dist2 '())
      (index 0)
      )
  (dotimes (ival (/ (length distvector) 2))
    (add-to-list 'dist1 (aref distvector index) t)
    (add-to-list 'dist2 (aref distvector (+ index 1)) t)
    (setq index (+ index 2))
    )
  (sort dist1 '<)
  )



(insert-file-contents "./distance.txt")




