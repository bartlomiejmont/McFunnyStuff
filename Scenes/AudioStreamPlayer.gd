extends AudioStreamPlayer

func _on_Player_animate(motion):
	if (motion.x != 0 or motion.y != 0) and playing == false:
		self.play()
	elif motion.x == 0 and motion.y == 0:
		self.stop()
