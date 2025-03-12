extends Area2D
#click checker for enemy


func _input_event(viewport,event,shape_idx):
	if event.is_action_pressed("left_click"):
		#print("CLICKED")
		Globals.slime_clicked.emit()
