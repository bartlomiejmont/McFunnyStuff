extends AnimatedSprite



func _on_Zombie_animateZ(movingRight):
	if  movingRight:
		flip_h = true
	else:
		flip_h = false
