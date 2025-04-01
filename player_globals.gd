extends Node

static var level = 10

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

var score = 0
var base_score = 100
func add_score(time):
	var added_score  = base_score * (time/30)
	score += added_score
	score = snapped(score,0.01)
	print("Points: " + str(score))
