extends AnimatedSprite

signal punch
var punching = false

func _on_Player_animate(motion):
	if not punching:
		if  Input.is_key_pressed(KEY_SPACE):
			emit_signal("punch")
			punching = true
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

func _on_AnimationPlayer_animation_finished(anim_name):
	punching = false
