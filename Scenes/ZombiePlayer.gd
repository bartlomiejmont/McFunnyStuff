extends AnimationPlayer

var Hit = false

func _process(delta):
	if Hit:
		play("Hit")



func _on_ZombieAnimation_moveL():
	if not Hit:
		play("moveL")


func _on_ZombieAnimation_moveR():
	if not Hit:
		play("moveR")


func _on_ZombiePlayer_animation_finished(anim_name):
	if anim_name == "Hit":
		Hit = false
