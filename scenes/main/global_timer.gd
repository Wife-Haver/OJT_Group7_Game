extends Panel

func _ready() -> void:
	# Start the global timer if it's not running
	GlobalTimer.start()
	
func _process(delta: float) -> void:
	var time = GlobalTimer.get_time()
	
	if time > 0:
		var msec = fmod(time, 1) * 100
		var sec = fmod(time, 60)
		var min = fmod(time, 3600) / 60

		$minutes.text = "%02d:" % min
		$seconds.text = "%02d." % sec
		$miliseconds.text = "%03d" % msec
	else:
		GlobalTimer.stop()
		get_tree().change_scene_to_file("uid://b7kt5njxwigxk") # game over scene
