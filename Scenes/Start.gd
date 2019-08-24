extends Node



func _on_TextureButton_pressed():
	yield(get_tree().create_timer(0.3), "timeout")
	get_tree().change_scene("res://Scenes/Game.tscn")
