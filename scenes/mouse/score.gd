extends RichTextLabel

@onready var score_label = $"."
var score = 0
func _on_mouse_scene_increase_score():
	score+=1
	score_label.text=("Score:"+str(score))
