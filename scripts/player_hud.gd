extends Control

@onready var hp_bar = $hp
var hp = 10
func _ready():
	hp_bar.value=hp
	
func recieve_dmg():
	hp-=1
	hp_bar.value = hp
	if hp==0:
		print("YOU LOSE")
		get_tree().change_scene_to_file("res://scenes/game_over_screen.tscn")

func _on_battle_scene_typing_wrong_input():
	recieve_dmg()
