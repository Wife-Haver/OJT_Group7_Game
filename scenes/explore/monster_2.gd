extends Area2D

@onready var self_hitbox = $"."

var mouse_training_path:String = Globals.get_mouse_scene()


func _start_battle():
	var player = get_tree().get_first_node_in_group("player")
	PlayerGlobals.previous_scene = get_tree().current_scene.scene_file_path
	if player:
		SceneTransition.change_scene(mouse_training_path)


func _on_body_entered(body):
	if body.is_in_group("player"):
		
		_start_battle()
		#queue_free()
	
