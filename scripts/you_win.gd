extends Node2D

func _ready():
	Globals.connect("enemy_beat",_show_thing)
	
func _show_thing():
	print("printing_this")
