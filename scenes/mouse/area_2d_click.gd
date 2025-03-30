extends Area2D

func _ready():
	print(self.collision_layer)
	

func _on_input_event(viewport, event, shape_idx):
	print("Input event received: ", event)
	#if event.is_action_pressed("left_click"):
		#print("clicked")
