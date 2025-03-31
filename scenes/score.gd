extends RichTextLabel

#points
func _ready():
	var level = PlayerGlobals.score
	
	self.text = ("points: "+ str(level))
