extends Node2D

@onready var sprite = $"."
@onready var timer = $"../Timer"


func _ready():
	sprite.modulate.a = 0
	_tween_sprite()
	
func _tween_sprite():
	var tween = get_tree().create_tween()
	#fade in plus move up
	tween.set_parallel(true)
	tween.tween_property(sprite,"modulate:a",1,1)
	tween.tween_property(sprite,"position:y",sprite.position.y-100,1).set_ease(Tween.EASE_IN_OUT)
	#fade out
	tween.set_parallel(false)
	tween.tween_interval(0.5)
	tween.tween_property(sprite,"modulate:a",0,0.5)

	tween.finished.connect(_done)
	
func _done():
	queue_free()
	print("sprite freed")
