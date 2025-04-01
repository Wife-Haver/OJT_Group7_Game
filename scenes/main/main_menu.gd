extends TextureRect#WIP SCRIPT
@onready var texture_button = $CanvasLayer/TextureButton

func _ready():
	if texture_button:
		print("ready")
	print(self.z_index)
	print(texture_button.z_index)

func _on_texture_button_pressed():
	print("pressed")
	SceneTransition.change_scene(Globals.get_explore_scene())
	GlobalTimer.is_running = true
	#get_tree().change_scene_to_file(Globals.get_explore_scene())
