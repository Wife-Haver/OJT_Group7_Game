extends Area2D

@onready var self_hitbox = $"."

var battle_scene_path:String = Globals.get_typing_scene()

func start_battle():
	get_tree().change_scene_to_file(battle_scene_path)
	Globals.enemy_beat.connect(_on_body_entered)


func _on_body_entered(body):
	start_battle()
