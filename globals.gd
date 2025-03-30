extends Node

signal slime_clicked

signal room_door_entered

signal send_points

var player_position

var remaining_time

func get_typing_scene()->String:
	var typing_scene = "uid://cli8axqww0awl"
	return typing_scene

func get_explore_scene()->String:
	var explore_scene = "uid://wnusy1ic0ty0" #"uid://ijpgjdcxx1ku" old
	return explore_scene

func get_mouse_scene()->String:
	var mouse_scene = "uid://bu5sibl24iasa"

	return mouse_scene

var you_win_bool :bool = false

func you_won_img():
	if you_win_bool == true:
		var you_won_img = preload("uid://dk0n1uuqdqxgk").instantiate()
		add_child(you_won_img)
		you_win_bool = false
	else:
		print("did not win")
