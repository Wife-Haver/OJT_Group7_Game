extends RichTextLabel

@onready var level_label = $"."
var crnt_lvl = PlayerGlobals.get_level()

func _ready():
	level_label.text = "Score: "+ str(crnt_lvl)
