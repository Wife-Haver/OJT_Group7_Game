extends Node

@onready var button = $try_again


#button.scale
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var mouse_pos = button.get_global_mouse_position()
		var button_pos = button.global_position
		var button_size = button.texture.get_size() * 1.5
		#
		# Check if click is within slime's bounding box
		if (mouse_pos.x >= button_pos.x - button_size.x/2 and 
			mouse_pos.x <= button_pos.x + button_size.x/2 and 
			mouse_pos.y >= button_pos.y - button_size.y/2 and 
			mouse_pos.y <= button_pos.y + button_size.y/2):
				
				print("try_again clicked")
				SceneTransition.change_scene(Globals.get_explore_scene())
				PlayerGlobals.set_hp(10)
				PlayerGlobals.level = 1
				PlayerGlobals.score = 0
				GlobalTimer.reset()
		else:
			print("try_again wrong click")



#
