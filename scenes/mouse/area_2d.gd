extends Area2D



func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		print("click")
		Globals.slime_clicked.emit()
		
