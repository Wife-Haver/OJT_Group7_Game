extends Node2D

var current_letter_index: int = 0
@onready var target_text = $battle_scene_HUD/target_text

signal typing_success
signal wrong_input

var player_current_level = PlayerGlobals.get_level()
var words = EnemyGlobals.get_words(player_current_level)#get_words returns array

var prompt:String = ""  # Initialize prompt



func pick_random():
	words = EnemyGlobals.get_words(player_current_level)
	prompt = words.pick_random()  # Update the global variable
	current_letter_index = 0  # Reset typing progress
	update_text_display()  # Update text with colors

func update_text_display():
	var typed_part = "[color=green]%s[/color]" % prompt.substr(0, current_letter_index)  # Typed letters in green
	var remaining_part = "[color=white]%s[/color]" % prompt.substr(current_letter_index)  # Remaining letters in white
	target_text.bbcode_text = "[center]%s%s[/center]" % [typed_part, remaining_part]

func _unhandled_input(event: InputEvent):
	if event is InputEventKey and event.is_pressed() and not event.is_echo():
		var typed_event = event as InputEventKey
		var key_typed = PackedByteArray([typed_event.unicode]).get_string_from_utf8()

		if current_letter_index < prompt.length():
			var next_character = prompt[current_letter_index]
			if key_typed == next_character:
				current_letter_index += 1
				update_text_display()  # Update color when a letter is typed
				if current_letter_index == prompt.length():#runs if answer is correct
					emit_signal("typing_success")
					pick_random()
			else:
					emit_signal("wrong_input")

func _ready():
	
	target_text.bbcode_enabled = true  # Enable BBCode for coloring
	pick_random()  # Ensure a prompt is selected at the start
