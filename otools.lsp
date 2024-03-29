(vl-load-com)
(if (not (or utf8demandload (load "utf8loader.lsp" nil)))
	(progn
		(princ "\nutf8loader.lsp not found.")
	)
	(progn
		(utf8demandload "alignmentText.lsp" '(c:alignmentText))
		(utf8demandload "angBlock.lsp" '(c:angBlock))
		(utf8demandload "angHatch.lsp" '(c:angHatch))
		(utf8demandload "angText.lsp" '(c:angText))
		(utf8demandload "attdefToText.lsp" '(c:attdefToText))
		(utf8demandload "batchPurge.lsp" '(c:batchPurge))
		(utf8demandload "bgcCtrl.lsp" '((c:bgcCtrl) (c:bgcCtrl_Model a) (c:bgcCtrl_Layout a)))
		(utf8demandload "changeColor.lsp" '(c:changeColor))
		(utf8demandload "changeLayer.lsp" '(c:changeLayer))
		(utf8demandload "changeLinetype.lsp" '(c:changeLinetype))
		(utf8demandload "chBylayerColor.lsp" '(c:chBylayerColor))
		(utf8demandload "chBylayerTColor.lsp" '(c:chBylayerTColor))
		(utf8demandLoad "copyTextStr.lsp" '(c:copyTextStr))
		(utf8demandLoad "countBlock.lsp" '(c:countBlock))
		(utf8demandLoad "countText.lsp" '(c:countText))
		(utf8demandload "draworderCtrl.lsp" '((c:draworderAuto) (c:draworderLayer) (c:draworderLayer_args a)))
		(utf8demandload "easyBlock.lsp" '(c:easyBlock))
		(utf8demandload "easyExtend.lsp" '(c:easyExtend))
		(utf8demandload "easySlice.lsp" '(c:easySlice))
		(utf8demandload "exchangeText.lsp" '(c:exchangeText))
		(utf8demandload "extEditor.lsp" '(c:extEditor))
		(utf8demandload "grip.lsp" '((c:grip) (c:copyGrip)))
		(utf8demandload "hatchMove.lsp" '(c:hatchMove))
		(utf8demandload "layrev.lsp" '(c:layrev))
		(utf8demandload "laystdctr.lsp" '(c:layAllOn))
		(utf8demandload "laystdctr.lsp" '(c:layAllOff))
		(utf8demandload "laystdctr.lsp" '(c:laySSOn))
		(utf8demandload "laystdctr.lsp" '(c:laySSOff))
		(utf8demandload "laystdctr.lsp" '(c:layPickNestOn))
		(utf8demandload "laystdctr.lsp" '(c:layPickNestOff))
		(utf8demandload "linkScale.lsp" '(c:linkScale))
		(utf8demandload "magnetText.lsp" '(c:magnetText))
		(utf8demandload "menRec.lsp" '(c:menRec))
		(utf8demandload "parallelogram.lsp" '(c:parallelogram))
		(utf8demandload "putLengthText.lsp" '(c:putLengthText))
		(utf8demandload "pviewportPan.lsp" '(c:pviewportPan))
		(utf8demandload "pviewportLock.lsp" '(c:pviewportLock))
		(utf8demandload "pviewporttoModel.lsp" '(c:pviewportToModel))
		(utf8demandload "setScaleFactor.lsp" '(c:setScaleFactor))
		(utf8demandload "srtObj.lsp" '(c:srtObj))
		(utf8demandLoad "stackCopy.lsp" '(c:stackcopy))
		(utf8demandLoad "stepCopy.lsp" '(c:stepCopy))
		(utf8demandLoad "stepMove.lsp" '(c:stepMove))
		(utf8demandLoad "textEditAd.lsp" '(c:textEditAd))
		(utf8demandLoad "verticalScale.lsp" '(c:verticalScale))
	)
)