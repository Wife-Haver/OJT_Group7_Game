extends Area2D

@onready var self_hitbox = $"."

var mouse_training_path:String = Globals.get_mouse_scene()
#var enemy_id: String = "enemy"

func _ready():
	#if EnemyGlobals.is_enemy_defeated(get_tree().current_scene.scene_file_path, enemy_id):
	queue_free()
	#else:
		#self_hitbox.add_to_group("enemy")

func _start_battle():
	var player = get_tree().get_first_node_in_group("player")
	PlayerGlobals.previous_scene = get_tree().current_scene.scene_file_path
	if player:
		PlayerGlobals.save_player_position(player.position)
		get_tree().change_scene_to_file(mouse_training_path)


func _on_body_entered(body):
	if body.is_in_group("player"):
		#EnemyGlobals.mark_enemy_defeated(get_tree().current_scene.scene_file_path, enemy_id)
		_start_battle()
		queue_free()
	
