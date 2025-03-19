extends Area2D

#emits signal if entered
func _on_body_entered(body):
	Globals.emit_signal("room_door_entered")
