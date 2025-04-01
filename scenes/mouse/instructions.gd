extends RichTextLabel

var tween_rotate: Tween
var tween_scale: Tween
var is_animating := false

func _ready():
	start_animation()

func start_animation():
	if is_animating:
		return
		
	is_animating = true
	
	# Rotation animation (left to right)
	tween_rotate = create_tween().set_loops().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween_rotate.tween_property(self, "rotation_degrees", 3.0, 1.5)
	tween_rotate.tween_property(self, "rotation_degrees", -3.0, 1.5)
	tween_rotate.tween_property(self, "rotation_degrees", 0.0, 0.5)
	
	# Scale animation (zoom in and out)
	tween_scale = create_tween().set_loops().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
	tween_scale.tween_property(self, "scale", Vector2(1.05, 1.05), 1.0)
	tween_scale.tween_property(self, "scale", Vector2(1.0, 1.0), 1.0)

func stop_animation():
	if tween_rotate:
		tween_rotate.kill()
	if tween_scale:
		tween_scale.kill()
	is_animating = false
	rotation_degrees = 0.0
	scale = Vector2(1.0, 1.0)
