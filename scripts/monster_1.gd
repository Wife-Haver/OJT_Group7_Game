extends Area2D

@onready var self_hitbox = $"."

var battle_scene_path:String = Globals.get_typing_scene()


func start_battle():
	var player = get_tree().get_first_node_in_group("player")
	PlayerGlobals.previous_scene = get_tree().current_scene.scene_file_path
	if player:
		
		SceneTransition.change_scene(battle_scene_path)



func _on_body_entered(body):
	if body.is_in_group("player"):
		
		start_battle()
		#queue_free()
