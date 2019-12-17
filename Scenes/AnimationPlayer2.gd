extends AnimationPlayer


func _ready():
	pass # Replace with function body.


func _on_AnimatedSprite_hit():
	play("hit")
