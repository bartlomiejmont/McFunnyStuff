extends Area2D

signal layer

func _ready():
	setLayer()

func _process(delta):
	setLayer()

func setLayer():
	emit_signal("layer",int(position.y/10))