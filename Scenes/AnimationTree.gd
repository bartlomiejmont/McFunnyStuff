extends AnimationTree

var animTree

func _ready():
	animTree = self.get("parameters/playback")
	self.set_active(true)
	

func _on_AnimatedSprite_hit():
	animTree.travel("Hit")
	print("Hit")


func _on_AnimatedSprite_punch():
	animTree.travel("Punching")
	print("punch")


func _on_AnimatedSprite_runL():
	animTree.travel("WalkingL")


func _on_AnimatedSprite_runR():
	animTree.travel("WalkingR")


func _on_AnimationTree_tree_exited():
	animTree.travel("Idle")
