extends Node

var custom_crosshair_img = load("res://assets/images/crosshair.png")
var spawnable_area = Vector2(800,400)

@onready var slime = $AnimatedSprite2D

signal increase_score
signal deduct_hp

#1152.0, 648.0 screen size
func _ready():
	# sets customer cursor and centers it
	Input.set_custom_mouse_cursor(custom_crosshair_img, Input.CURSOR_ARROW,
	custom_crosshair_img.get_size() / 2)
	Globals.slime_clicked.connect(_spawn_enemy)

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var mouse_pos = slime.get_global_mouse_position()
		var slime_pos = slime.global_position
		var slime_size = slime.sprite_frames.get_frame_texture("default", 0).get_size() * slime.scale
		
		# Check if click is within slime's bounding box
		if (mouse_pos.x >= slime_pos.x - slime_size.x/2 and 
			mouse_pos.x <= slime_pos.x + slime_size.x/2 and 
			mouse_pos.y >= slime_pos.y - slime_size.y/2 and 
			mouse_pos.y <= slime_pos.y + slime_size.y/2):
			
			# Only spawn new enemy if we clicked the current one
			_spawn_enemy()

		else:
			print("wrong click")
			deduct_hp.emit()

func _spawn_enemy():
	#print("SPAWNED")
	var new_position = Vector2(
		randi() % int(spawnable_area.x),
		randi() % int(spawnable_area.y)
	)
	slime.position = new_position
	increase_score.emit()
