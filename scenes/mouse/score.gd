extends RichTextLabel

@onready var score_label = $"."
var score = 0
var max_score = EnemyGlobals.calc_typing_enemy_hp()

func _ready():
	score_label.text=("Score: "+str(score)+"/"+str(max_score))

func _update_score_label():
	score_label.text = "Score: " + str(score) + "/" + str(max_score)

func _on_mouse_scene_increase_score():
	if score < max_score:
		score+=1
		#print(score)
		_update_score_label()
	if score == max_score:
		PlayerGlobals.add_level()
		EnemyGlobals.enemy_defeated.emit()
		get_tree().change_scene_to_file(PlayerGlobals.previous_scene)
		
		## Ensure the previous scene path is valid
		#if PlayerGlobals.previous_scene and ResourceLoader.exists(PlayerGlobals.previous_scene):
			#get_tree().change_scene_to_file(PlayerGlobals.previous_scene)
		#else:
			#print("Error: Invalid or missing previous scene path.")
func _exit_tree():
	Input.set_custom_mouse_cursor(null)
