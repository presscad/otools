(defun c:menRec(/ *error*)
	(vl-load-com)
	(defun *error* (s) (princ "\nowari.")(princ))
	(setq obj (vlax-create-object "htmlfile"))
	(setq ppp (vlax-get-property obj "parentwindow"))
	(setq ccc (vlax-get-property ppp "clipboarddata"))
	(setq strs "")
	(while t
		(setq pt1 (getpoint "\npt1:"))
		(setq pt2 (getcorner pt1 "pt2:"))
		(setq tmp (mapcar '- pt1 pt2))
		(setq xxx (abs (* (car tmp) 0.001)))
		(setq yyy (abs (* (cadr tmp) 0.001)))
		(setq strs (strcat strs "\n" (rtos xxx 2 4) "\t" (rtos yyy 2 4)))
		(setq strs (vl-string-left-trim "\n" strs))
		(terpri)(princ strs)
		(vlax-invoke ccc 'setData "text" strs)
	)
	(princ)
)
