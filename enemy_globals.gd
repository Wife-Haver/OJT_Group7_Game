extends Node

var lvl = PlayerGlobals.get_level()

signal enemy_defeated

func _ready():
	EnemyGlobals.enemy_defeated.connect(on_enemy_defeated)

func on_enemy_defeated():
	print("enemy_died")

func calc_typing_enemy_hp():
	var hp = 5 + (lvl - 1) * 2
	return hp

func get_words(curr_lvl):#get words according to difficulty
	var five_letters=["apple","brave","cloud","dance","eagle",
	"flare","glove","honey","ideal","jolly"]
	var six_letters=["banana","castle","dragon","floral","garden",
	"hammer","insect","jigsaw","kernel","Lizard"]
	var seven_letters=["bicycle","diamond","eclipse","festival","glacier"]
	var eight_letters=["adventure","basketball","chocolate","elephant","firewall"]
	var nine_letters=["butterfly","challenge","framework"]
	
	var word_list=[]
	if curr_lvl <= 5:
		word_list += five_letters
	if curr_lvl >=9:
		word_list+= six_letters
	if curr_lvl >=13:
		word_list += seven_letters
	if curr_lvl >=17:
		word_list+= eight_letters
	if curr_lvl >=21:
		word_list+= nine_letters
	return word_list
	
func get_enemy():
	var keyboard_enemy = "uid://c6nn0e2yayw7d"
	var mouse_enemy = "uid://dc5m8d88dnknr"
	
	var enemies = [keyboard_enemy, mouse_enemy]
	var selected_enemy = enemies.pick_random()
	return selected_enemy


var defeated_enemies = {}

func mark_enemy_defeated(scene_path:String, enemy_id:String):
	if not scene_path in defeated_enemies:
		defeated_enemies[scene_path] = []
	defeated_enemies[scene_path].append(enemy_id)
	print(str(defeated_enemies))

func is_enemy_defeated(scene_path:String, enemy_id:String) -> bool:
	return scene_path in defeated_enemies and enemy_id in defeated_enemies[scene_path]

var enemy_amt = 0
