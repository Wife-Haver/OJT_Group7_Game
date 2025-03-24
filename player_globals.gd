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

# Save player's position
func save_player_position(position: Vector2):
	player_position = position
	print("saved"+str(player_position))

# Get player's position
func get_player_position() -> Vector2:
	return player_position

func restore_player_position():
	var player = get_tree().get_first_node_in_group("player")
	
	if player:
		player.position = player_position
