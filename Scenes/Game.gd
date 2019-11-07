extends Node2D

signal changeHP

var PlayerHP = 10
var Level = 1
var timer = 1

func _ready():
	emit_signal("changeHP",PlayerHP)



func _on_Player_hitPlayer():
	PlayerHP -=1
	emit_signal("changeHP",PlayerHP)


func _on_Level_timeout():
	timer *= 2
	$Level.wait_time = timer
	print(timer)
