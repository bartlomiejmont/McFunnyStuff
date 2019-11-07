extends AnimatedSprite

signal punch
signal runR
signal runL
signal hit
var punching = false
var hiting = false

func _on_Player_animate(motion):
	if not punching and not hiting:
		if  Input.is_action_just_pressed("punch") and $"../PlayerInside".get_overlapping_areas().size() == 0:
			emit_signal("punch")
			punching = true
		elif motion.x > 0:
			emit_signal("runR")
#			self.flip_h = true
#			self.play("run")
		elif motion.x < 0:
			emit_signal("runL")
#			self.flip_h = false 
#			self.play("run")
		elif motion.y != 0:
			self.play("run")
		else:
			self.play("idle")

func _on_AnimationPlayer_animation_finished(anim_name):
	print(playing)
	if anim_name == "Punching":
		punching = false
	elif anim_name == "Hit":
		hiting = false



func _on_Player_hitPlayer():
#	$AnimationPlayer.stop()
	hiting = true
	emit_signal("hit")
