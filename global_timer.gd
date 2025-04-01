extends Node

var time: float = 420.0
var is_running:bool = false

func _process(delta:float) -> void:
	if is_running and time > 0:
		time -= delta
		time = max(time,0)

func get_time() ->float:
	return time

func set_time(new_time:float) -> void:
	time = new_time

func start() -> void:
	is_running = true

func stop() -> void:
	is_running = false

func reset(new_time:float = 420.0) -> void:
	time = new_time
	is_running = true

func get_formatted_time() -> String:
	var min = fmod(time,3600)/60
	var sec = fmod(time, 60)
	var msec = fmod(time, 1) * 100
	return "%02d:%02d.%02d" % [min, sec, msec]	
