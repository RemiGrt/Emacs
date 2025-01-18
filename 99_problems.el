;; https://github.com/meagtan/99-lisp-problems/tree/master/src/01-28%20lists

  "Find the last box of a list.
Example:
* (my-last '(a b c d))
(D)"

(defun rg-last (list)
  (when list
    (if (cdr list)
	(rg-last (cdr list))
      list)
    )
  )

(rg-last '(a b c d))
