extends Control

var pause

func _ready():
	pause = false

func _input(event):
	if event.is_action_pressed("pause") and not pause:
		get_tree().paused = true
		pause = true
		visible = true
	elif event.is_action_pressed("pause") and pause:
		get_tree().paused = false
		pause = false
		visible = false
