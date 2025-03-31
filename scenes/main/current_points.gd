extends RichTextLabel

@onready var points_label = $"."

var crnt_points = PlayerGlobals.score

func _ready():
	points_label.text=str(crnt_points)
