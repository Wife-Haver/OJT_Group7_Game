extends ProgressBar

@onready var hp_bar = $"."
var hp_amt = PlayerGlobals.get_hp()

func _ready():
	hp_bar.value = hp_amt

func recieve_dmg():
	hp_amt -= 1
	hp_bar.value =hp_amt
	PlayerGlobals.set_hp(-1)
	
	if hp_amt == 0:
		print("YOU LOSE")
		SceneTransition.change_scene("uid://b7kt5njxwigxk")#game over scene

func _process(delta):
	hp_bar.value = hp_amt



func _on_mouse_scene_deduct_hp():
	recieve_dmg()
