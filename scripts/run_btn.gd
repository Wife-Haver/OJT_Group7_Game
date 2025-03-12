extends Button


var explore_mode_scene := "res://scenes/explore/explore_scene.tscn"
func run_battle():
	get_tree().change_scene_to_file(explore_mode_scene)
	Globals.emit_signal("enemy_beat")

func _on_pressed() -> void:
	run_battle()
	
	print("BATTLE FLED")
