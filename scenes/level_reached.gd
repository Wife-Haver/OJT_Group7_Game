extends RichTextLabel

#level reached
func _ready():
	var level = PlayerGlobals.get_level()
	
	self.text = ("Level reached: "+ str(level))
