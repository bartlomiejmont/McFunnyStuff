extends Node2D


signal labelHP

func _ready():
	pass


func _on_Game_changeHP(HP):
	emit_signal("labelHP",HP)
