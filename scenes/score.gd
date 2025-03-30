extends RichTextLabel


func _ready():
	var level = PlayerGlobals.get_level()
	
	self.text = ("Score: "+ str(level))
