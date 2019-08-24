extends AnimatedSprite

func _on_Player_animate(motion):
	if Input.is_key_pressed(KEY_SPACE):
		self.play("punch")
	elif motion.x > 0:
		self.flip_h = true
		self.play("run")
	elif motion.x < 0:
		self.flip_h = false 
		self.play("run")
	elif motion.y != 0:
		self.play("run")
	else:
		self.play("idle")