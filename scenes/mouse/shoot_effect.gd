extends Node2D



func _ready():
	var effect_scene = load("res://scenes/mouse/shoot_effect.tscn")
	for i in range(5):
		
		var instance = effect_scene.instantiate()
		add_child(instance)
		instance.position = Vector2()
