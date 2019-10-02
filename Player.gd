extends KinematicBody2D

# Declare member variables here. Examples:
var motion = Vector2()
const SPEED = 300
signal animate
signal layer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	moveV()
	moveH()
	animate()
	move_and_slide(motion)
	setLayer()

func _physics_process(delta):
	pass

func moveV():
	if Input.is_key_pressed(KEY_SPACE):
		motion.x=0
	elif Input.is_action_pressed("ui_right") && !Input.is_action_pressed("ui_left"):
		motion.x=SPEED
	elif Input.is_action_pressed("ui_left") && !Input.is_action_pressed("ui_right"):
		motion.x=-SPEED
	else:
		motion.x = 0

func moveH():
	if Input.is_key_pressed(KEY_SPACE):
		motion.y=0
	elif Input.is_action_pressed("ui_up") && !Input.is_action_pressed("ui_down"):
		motion.y=-SPEED*0.6
	elif Input.is_action_pressed("ui_down") && !Input.is_action_pressed("ui_up"):
		motion.y=SPEED*0.6
	else:
		motion.y = 0

func animate():
	emit_signal("animate", motion)

func setLayer():
	emit_signal("layer",int(position.y/10))
