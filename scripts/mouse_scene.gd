extends Node

var custom_crosshair_img = load("res://assets/images/crosshair.png")
var window_size = Vector2(1000,600)



@onready var slime = $monster_1_mouse

signal increase_score
#1152.0, 648.0
func _ready():
	# sets customer cursor and centers it
	Input.set_custom_mouse_cursor(custom_crosshair_img, Input.CURSOR_ARROW,
	custom_crosshair_img.get_size() / 2)
	
	window_size = get_window().size
	Globals.slime_clicked.connect(_spawn_enemy)
	print(window_size)
	
	
func _spawn_enemy():
	print("SPAWNED")
	var new_position = Vector2(
		randi() % int(window_size.x),
		randi() % int(window_size.y)
	)
	slime.position = new_position
	increase_score.emit()
	
	
