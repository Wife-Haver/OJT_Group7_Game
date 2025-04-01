extends Node

var lvl = PlayerGlobals.get_level()

signal enemy_defeated

func calc_typing_enemy_hp():
	var hp
	if PlayerGlobals.get_level() <= 3:
		hp = 5
		print("enemy hp:" + str(hp))
		return hp
	else: hp = PlayerGlobals.get_level() + 2
	print("enemy hp:" + str(hp))
	return hp

func get_words(curr_lvl):#get words according to difficulty
	var five_letters=["apple","brave","cloud","dance","eagle",
	"flare","glove","honey","ideal","jolly"]
	var six_letters=["banana","castle","dragon","floral","garden",
	"hammer","insect","jigsaw","kernel","Lizard"]
	var seven_letters=["bicycle","diamond","eclipse","festival","glacier","fantasy",
	"rainbow","emerald","strengthen","dangerous"]
	var eight_letters=["adventure","basketball","chocolate","elephant","firewall","butterfly",
	"velocity","champion","treasure","mountain"]
	var nine_letters=["butterfly","challenge","framework","adventure","brilliant","happiness",
	"strengthen","fireworks","fantastic"]
	
	var word_list=[]
	if curr_lvl >= 1:
		word_list += five_letters
	if curr_lvl >=4:
		word_list += six_letters
	if curr_lvl >=6:
		word_list += seven_letters
	if curr_lvl >=8:
		word_list+= eight_letters
	if curr_lvl >=10:
		word_list+= nine_letters
	return word_list
	
func get_enemy():
	var keyboard_enemy = "uid://c6nn0e2yayw7d"
	var mouse_enemy = "uid://dc5m8d88dnknr"
	
	if PlayerGlobals.get_level() % 2 == 0:
		return mouse_enemy
	else:
		return keyboard_enemy
	
	#random picking
	#var enemies = [keyboard_enemy, mouse_enemy]
	#var selected_enemy = enemies.pick_random()
	#return selected_enemy
