

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
);;rg-buff2matrix

(setq matrice (rg-buff2matrix "./distance.txt"));;[[13432 99527] [85422 64009] [79131 11256] [27674 82211] [65599 57936] [12692 67107] [29421 44641] [48876 12545] [62591 59319] [16202 93012] [79559 55075] [94998 31881] ...][[13432 99527] [85422 64009] [79131 11256] [27674 82211] [65599 57936] [12692 67107] [29421 44641] [48876 12545] [62591 59319] [16202 93012] [79559 55075] [94998 31881] ...]

(aref (aref matrice 0) 0) ;;13432
(aref (aref matrice 1) 0) ;; 85422
(length matrice);;1000


(progn
  (setq dist1 (make-vector (length matrice) 0));;[0 0 0 0 0 0 0 0 0 0 0 0 ...]
  (setq dist2 (make-vector (length matrice) 0));;[0 0 0 0 0 0 0 0 0 0 0 0 ...]
  (setq result (make-vector (length matrice) 0));;[0 0 0 0 0 0 0 0 0 0 0 0 ...]
  );;[0 0 0 0 0 0 0 0 0 0 0 0 ...][0 0 0 0 0 0 0 0 0 0 0 0 ...]

(dotimes (index (length matrice))
  (progn
    (aset dist1 index (aref (aref matrice index) 0) )
    (aset dist2 index (aref (aref matrice index) 1) ))
  );;nilnil

dist1;;
dist2;;

(progn
 (sort dist1 '<) ;;
 (sort dist2 '<) ;;
);;

dist1;;
dist2;;


(dotimes (index (length matrice))
  (aset result index (abs (- (aref dist1 index) (aref dist2 index)))));;nil

(setq resultfinal 0);;0
(dotimes (index (length matrice))
  (setq resultfinal (+ resultfinal  (abs (- (aref dist1 index) (aref dist2 index))))));nil


result;;[13 124 123 20 26 34 0 98 170 190 441 492 ...]
resultfinal;;1765812

;; Part 2 ;;
(setq bob [1 2 3 4 4 5]);;[1 2 3 4 4 5]
(cl-position 6 bob);;nil

dist1;;

(setq occur_nb (make-vector (length matrice) 0));; [0 0 0 0 0 0 0 0 0 0 0 0 ...]
(with-temp-buffer
  (insert-file-contents "./distance.txt")
  
  (dotimes (index (length matrice))
    (aset occur_nb index (count-matches (number-to-string (aref dist1 index)))))
  occur_nb
  );;[1 1 1 1 1 1 11 1 1 1 1 1 ...]

(number-to-string 10384)

(insert occur_nb)

