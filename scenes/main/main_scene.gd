extends Node
#"res://scenes/explore/rooms/room.tscn"
var room_scene = preload("uid://bm2y1ryb2exuk")
var room_instance = room_scene.instantiate()

func _ready():
	_init_room()
	_get_enemy_pos()
	

func _typer_or_mouse():
	var typing_enemy = "uid://c6nn0e2yayw7d"
	var mouse_enemy  = "uid://dc5m8d88dnknr"
	var enemies = [typing_enemy, mouse_enemy]
	var selected_enemy = enemies.pick_random()

func _get_enemy_pos():
	var enemy_spawn_area = room_instance.get_node("enemy_spawn_area/CollisionShape2D").get_shape().size
	var enemy_spawn_point = enemy_spawn_area#get range of area
	
	
func _init_room():
	var new_room = room_scene.instantiate()
	new_room.position = Vector2(0,0)
	add_child(new_room)
