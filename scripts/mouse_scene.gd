extends Node

var custom_crosshair_img = load("res://assets/images/crosshair.png")
var spawnable_area = Vector2(800,400)

@onready var slime = $monster_1_mouse
@onready var slime_pos = slime.position



var slime_clicked_bool:bool = false

signal increase_score

#1152.0, 648.0 screen size
func _ready():
	# sets customer cursor and centers it
	Input.set_custom_mouse_cursor(custom_crosshair_img, Input.CURSOR_ARROW,
	custom_crosshair_img.get_size() / 2)
	Globals.slime_clicked.connect(_spawn_enemy)


func _spawn_enemy():
	#print("SPAWNED")
	var new_position = Vector2(
		randi() % int(spawnable_area.x),
		randi() % int(spawnable_area.y)
	)
	slime.position = new_position
	increase_score.emit()
	slime_clicked_bool = false
