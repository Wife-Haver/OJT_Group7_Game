extends Node

# Preload the room scene using its UID
var room_scene = preload("uid://bm2y1ryb2exuk")

# Instantiate the initial room and get its TileMap node
var init_room = preload("uid://bgaloyxsg5fe7").instantiate()
var init_tilemap = init_room.get_node("floor")


func _on_battle_won_img():
	var you_won_img = preload("uid://dk0n1uuqdqxgk").instantiate()
	add_child(you_won_img)


func _ready():
	#spawn enemy in initial room
	spawn_enemy(1)
	#play anim if won battle
	Globals.you_won_img()
	
	
	

func spawn_enemy(amt):
	var top_left = Vector2(90,60)
	var top_right = Vector2(400,60)
	var lower_right = Vector2(400,290)
	var lower_left = Vector2(60,290)
		
	var min_x = min(top_left.x, lower_left.x)
	var max_x = max(top_right.x, lower_right.x)
	var min_y = min(top_left.y, top_right.y)
	var max_y = max(lower_left.y, lower_right.y)
	
	
	for i in amt:
		#var enemy_id = "enemy_"+str(1)
		#if not EnemyGlobals.is_enemy_defeated(get_tree().current_scene.scene_file_path, enemy_id):
		var random_x = randf_range(min_x, max_x)
		var random_y = randf_range(min_y, max_y)
		var random_position = Vector2(random_x, random_y)
		
		var enemy_scene = EnemyGlobals.get_enemy()
		var enemy_instance = load(enemy_scene).instantiate()
		#enemy_instance.enemy_id = enemy_id
		enemy_instance.position = random_position
		enemy_instance.scale = Vector2(2, 2)
		#print("enemy_amount:"+str(enemy_amt))
		add_child(enemy_instance)

func on_enemy_defeated():
	spawn_enemy(1)
