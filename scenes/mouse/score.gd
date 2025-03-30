extends RichTextLabel

@onready var score_label = $"."
var score = 0
var max_score = EnemyGlobals.calc_typing_enemy_hp()

func _ready():
	score_label.text=("Score: "+str(score)+"/"+str(max_score))

func _process(delta):
	if score == max_score:#plays when win
		print("hawk tuah")
		PlayerGlobals.add_level()
		Globals.you_win_bool = true
		get_tree().change_scene_to_file(Globals.get_explore_scene())
func _update_score_label():
	score_label.text = "Score: " + str(score) + "/" + str(max_score)

func _on_mouse_scene_increase_score():
	if score < max_score:
		score+=1
		#print(score)
		_update_score_label()
	
		
		
func _exit_tree():
	Input.set_custom_mouse_cursor(null)
