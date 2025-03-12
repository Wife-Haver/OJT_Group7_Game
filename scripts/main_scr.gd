extends Node

@onready var entry = $Control/entry
@onready var target_label = $Control/target_text

@onready var enemy = $enemy

signal correct_ans_signal

var target = "typeme"

var words = ["apple", "banana", "cherry", "date", "blueberry", "melon", "grape","orange"]

func new_word():
	var random_word = words.pick_random()
	target = random_word
	target_label.text =target
	entry.text= ""
	

func _ready():
	entry.grab_focus()
	target_label.text =target
	entry.text_changed.connect(on_text_change)
	

func on_correct_signal():
	enemy.health_subtract()

func on_text_change(new_text):
	check_ans(new_text)


func check_ans(inp):
	if inp == target:
		correct_ans_signal.emit()



func _on_correct_ans_signal():
	print("correct")
	on_correct_signal()
	new_word()
	
