extends Panel

var time: float = 30.0  # Start at 30 seconds
var min: float = 0
var sec: float = 0
var msec: float = 0

func _process(delta) -> void:
	if time > 0:
		time -= delta
		time = max(time, 0)  # Ensure it doesn't go below zero
		
		msec = fmod(time, 1) * 100
		sec = fmod(time, 60)    
		min = fmod(time, 3600) / 60

		$minutes.text = "%02d:" % min
		$seconds.text = "%02d." % sec
		$miliseconds.text = "%03d" % msec

	else:
		stop()  # Stop when timer reaches zero
		get_tree().change_scene_to_file("uid://b7kt5njxwigxk")#game over scene

func stop() -> void:
	set_process(false)

func get_time_formatted() -> String:
	return "%02d:%02d.%02d" % [min, sec, msec]
