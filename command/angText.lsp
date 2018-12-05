(defun c:angText (/ *error* main doc)
	(vl-load-com)
	(defun main()
		(princ "\nangText")
		(vla-StartUndoMark (setq doc (vla-get-ActiveDocument (vlax-get-acad-object))))
		(if (setq ss (ssget "_:L" '((0 . "TEXT"))))
			(progn
				(initget 1)
				(setq pt1 (getpoint "\n1点目を指示:"))
				(initget 1)
				(setq pt2 (getpoint pt1 "\n2点目を指示:"))
				(setq ang (angle (trans pt1 1 0) (trans pt2 1 0)))
				(setq i 0)
				(repeat (sslength ss)
					(setq obj (vlax-ename->vla-object (ssname ss i)))
					(vla-put-Rotation obj ang)
					(setq i (1+ i))
				)
			)
		)
		(vla-EndUndoMark doc)
		(princ)
	)
	(defun *error* (s)
		(princ s)
		(vla-EndUndoMark doc)
		(princ)
	)
	(main)
)
