extends Button


var explore_mode_scene:String = Globals.get_explore_scene()
func run_battle():
	get_tree().change_scene_to_file(explore_mode_scene)
	Globals.emit_signal("enemy_beat")

func _on_pressed() -> void:
	run_battle()
	
	print("BATTLE FLED")
