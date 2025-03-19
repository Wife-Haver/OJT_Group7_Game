extends Area2D

@onready var self_hitbox = $"."

var mouse_training_path:String = Globals.get_mouse_scene()
func _start_battle():
	get_tree().change_scene_to_file(mouse_training_path)


func _on_body_entered(body):
	_start_battle()
