extends AnimatedSprite

signal moveR
signal moveL


func _on_Zombie_animateZ(movingRight):
	if  movingRight:
		emit_signal("moveR")
#		flip_h = true
	else:
		emit_signal("moveL")
#		flip_h = false
