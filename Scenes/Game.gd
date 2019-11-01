extends Node2D

signal changeHP

var PlayerHP = 10

func _ready():
	emit_signal("changeHP",PlayerHP)



func _on_Player_hitPlayer():
	PlayerHP -=1
	emit_signal("changeHP",PlayerHP)
