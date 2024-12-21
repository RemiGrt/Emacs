(let ((bags (with-temp-buffer
  (progn (insert "((")
	 (insert-file-contents "./input.txt")
	 (while (re-search-forward "^$" nil t)
	   (replace-match ")(" nil t))
	 (end-of-buffer)
	 (insert "))")
	 (goto-char 0))
  (read (current-buffer)))))
  (cl-reduce #'max
	     (mapcar (lambda (bag)
		       (cl-reduce #'+ bag))
		     bags
	  )))


