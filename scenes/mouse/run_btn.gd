extends Button

var explore_scene:String = Globals.get_explore_scene()

#run button to change scene to explore scene
func _on_pressed():
	get_tree().change_scene_to_file(PlayerGlobals.previous_scene)
