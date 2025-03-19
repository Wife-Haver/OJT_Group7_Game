extends Node2D

@onready var anm_sprite = $AnimatedSprite2D
@onready var hp_bar = $healthbar

#variable for current hp
var current_hp = EnemyGlobals.calc_typing_enemy_hp()


func _ready():
	hp_bar.value = current_hp
	hp_bar.max_value = current_hp
	anm_sprite.play("idle")
	anm_sprite.animation_finished.connect(_on_animation_finished) 
	
func health_add():
	current_hp+=1
	hp_bar.value = current_hp

func health_subtract(amt):
	current_hp-=amt
	hp_bar.value = current_hp
	anm_sprite.play("hurt")

func _on_animation_finished():
	if anm_sprite.animation == "hurt":  # Only switch to idle if "hurt" just finished
		anm_sprite.play("idle")

func _battle_end():
	print("BATTTLE WON")
	PlayerGlobals.add_level()
	get_tree().change_scene_to_file(Globals.get_explore_scene())#explore scene

func _on_typing_typing_success():
	
	health_subtract(1)
	if current_hp == 0:
		_battle_end()
