extends CanvasLayer

func _ready():
	self.layer=1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_Player_layer(pos):
	self.layer=pos
