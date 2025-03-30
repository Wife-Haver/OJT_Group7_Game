extends Node

static var level = 1

static var hp:int = 10

var player_position = Vector2.ZERO	
var previous_scene = ""

func set_hp(amt):
	hp = hp + amt
func get_hp():
	return hp

func get_level():
	return level

func add_level():
	level +=1
