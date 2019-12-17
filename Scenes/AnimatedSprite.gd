extends AnimatedSprite

signal punch
signal runR
signal runL
signal hit
var hiting = false
var AnimTree
var lastMove

func _ready():
	
	AnimTree = self.get_parent().get_node("AnimationTree").get("parameters/playback")

func _on_Player_animate(motion):
	if hiting:
		hiting = false
		emit_signal("hit")
	elif  Input.is_action_just_pressed("punch"):
		emit_signal("punch")
		return
	elif motion.x > 0:
		emit_signal("runR")
		lastMove = "R"
	elif motion.x < 0:
		emit_signal("runL")
		lastMove = "L"
	elif motion.y != 0 and lastMove == "R":
		emit_signal("runR")
	elif motion.y != 0 and lastMove == "L":
		emit_signal("runL")
	else:
		AnimTree.travel("Idle")



func _on_Player_hitPlayer():
	hiting = true;

