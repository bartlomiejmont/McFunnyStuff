extends Node2D


signal labelHP
signal labelPoints

func _ready():
	pass


func _on_Game_changeHP(HP):
	emit_signal("labelHP",HP)



func _on_Game_changePoints(points):
	emit_signal("labelPoints",points)
