extends Control

@onready var hp_bar = $hp
var hp = PlayerGlobals.get_hp()
func _ready():
	hp_bar.value = hp
	
func recieve_dmg():
	hp-=1
	hp_bar.value = hp
	PlayerGlobals.set_hp(-1)
	
	if hp==0:
		print("YOU LOSE")
		SceneTransition.change_scene("uid://b7kt5njxwigxk")#game over scene

func _process(delta):
	hp_bar.value = hp

func _on_battle_scene_typing_wrong_input():
	recieve_dmg()
	
