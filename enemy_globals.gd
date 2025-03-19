
extends Node

var lvl = PlayerGlobals.get_level()

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
	
