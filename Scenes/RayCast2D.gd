extends RayCast2D

signal colision


func _ready():
	pass

func _process(delta):
	pass




func _on_AnimatedSprite_punch():
	if is_colliding():
		emit_signal("colision",get_collider(),rotation_degrees)
		
