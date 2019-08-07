(defun c:countBlock (/ *error* main doc bnames enames)
	(vl-load-com)
	(defun main ()
		(princ "\ncountBlock")
		(setq htmlfile (vlax-create-object "htmlfile"))
		(setq ppp (vlax-get-property htmlfile "parentwindow"))
		(setq ccc (vlax-get-property ppp "clipboarddata"))
		(vla-StartUndoMark (setq doc (vla-get-ActiveDocument (vlax-get-acad-object))))
		(if (setq ss (ssget ":L" '((0 . "INSERT"))))
			(progn
				(setq i 0)
				(repeat (sslength ss)
					(setq ename (ssname ss i))
					(setq bnames (cons (cdr (assoc 2 (entget ename))) bnames))
					(setq i (1+ i))
				)
				(setq str "")
				(foreach bname (vl-sort (unique bnames) '<)
					(setq lst (vl-remove-if-not '(lambda (x) (= bname x)) bnames))
					(print (list bname (length lst)))
					(setq str (strcat str "\n" bname "\t" (itoa (length lst))))
				)
				(setq str (vl-string-left-trim "\n" str))
				;;(print str)
				(vlax-invoke ccc 'setData "text" str)
			)
		)
		(vla-EndUndoMark doc)
		(princ)
	)
	(defun unique (l)
		(if l (cons (car l) (unique (vl-remove (car l) l))))
	)
	(defun *error*(s)(princ s)(vla-EndUndoMark doc)(princ))
	(main)
)
