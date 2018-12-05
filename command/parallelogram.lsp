(defun c:parallelogram (/ *error* main line ucsChanged)
	(vl-load-com)
	(defun main()
		(princ "\nparallelogram")
		(vla-StartUndoMark (setq doc (vla-get-ActiveDocument (vlax-get-acad-object))))
		(setq spc (getspace doc))
		(setvar "cmdecho" 0)
		(initget 1)
		(setq pt1 (getpoint "\n1点目:"))
		(initget 1)
		(setq pt2 (getpoint pt1 "\n2点目:"))
		(setq pt1w (trans pt1 1 0))
		(setq pt2w (trans pt2 1 0))
		(setq line (vla-AddLine spc (vlax-3d-point pt1w )(vlax-3d-point pt2w)))
		(command "_ucs" "3p" pt1 pt2 "")
		(setq ucsChanged t)
		(initget 1)
		(setq pt3 (getpoint (trans pt2w 0 1)  "\n3点目:"))
		(setq pt3w (trans pt3 1 0))
		(setq ang (angle pt2w pt3w))
		(setq pt4w (polar pt1w ang (distance pt2w pt3w)))
		(setq ptList (list pt1w pt2w pt3w pt4w))
		(setq ptList (mapcar '(lambda(x) (reverse(cdr(reverse x)))) ptList))
		(setq sa (vlax-make-safearray vlax-vbDouble '(0 . 7)))
		(setq sa (vlax-safearray-fill sa (apply 'append ptList)))
		(setq pline (vla-AddLightWeightPolyline spc sa))
		(vla-put-Closed pline ':vlax-true)
		(if line (vla-Delete line))
		(if ucsChanged (command "_ucs" "p"))
		(vla-EndUndoMark doc)
		(princ)
	)
	(defun getSpace(doc)
		(if (and(= (vla-get-ActiveSpace doc) 0)(= (vla-get-MSpace doc) ':vlax-false))
			(vla-get-PaperSpace doc)
			(vla-get-ModelSpace doc)
		)
	)
	(defun *error* (s)
		(if line (vla-Delete line))
		(if ucsChanged (command-s "_ucs" "_p"))
		(vla-EndUndoMark doc)
		(princ s)
		(princ)
	)
	(main)
)
