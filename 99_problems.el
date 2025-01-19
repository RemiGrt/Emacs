;; https://github.com/meagtan/99-lisp-problems/tree/master/src/01-28%20lists

  "Find the last box of a list.
Example:
* (my-last '(a b c d))
(D)"

(setq a 3)

(1+ a)

(list "a" "b" "c")

;; 1

(defun rg-last (list)
  "Find the last box of a list.
Example:
* (my-last '(a b c d))
(D)"
  (when list
    (if (cdr list)
	(rg-last (cdr list))
      list)
    )
  )

;; 2

(defun rg-but-last (list)
  "Find the last but one box of a list.
Example:
* (my-but-last '(a b c d))
(C D)"
  (when list
    (if (cddr list)
	(rg-but-last (cddr list))
      list
      )
    )
  )

(rg-but-last '(a b c d))
		     

;; 3
(defun rg-element-at (list k)
  "Find the K'th element of a list.
The first element in the list is number 1.
Example:
* (element-at '(a b c d e) 3) C"
  (cond (
	 (= k 1) (car list)
	 )
        (
	 list (element-at (cdr list) (1- k)))
	)
  )

(rg-element-at '(1 2 3) 2)


(butlast '(1 2 3))

;; 4

(defun rg-size-list (list)
  "Find the number of elements of a list."
  (length list)
  )

(defun rg-length-list (list)
  "Find the number of elements of a list."
  (if list
      (1+ (rg-length-list (cdr list)))
    0
    )
  )

(when '() 
    (message "c une liste")
  )
    

(cdr '(1 2 3))
(length '( 1 2 3))
(rg-length-list '())


