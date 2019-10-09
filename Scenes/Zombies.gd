extends Node

signal slowDown



func _on_Player_hit(zombie,dgr):
	print(dgr)
	get_node("Zombie").HP-=1
	if dgr == 270:
		get_node("Zombie/Area2D").position.x+=40
	else:
		get_node("Zombie/Area2D").position.x-=40
	emit_signal("slowDown")
