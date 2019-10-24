extends KinematicBody2D

# Declare member variables here. Examples:
var motion = Vector2()
const SPEED = 300
var screen_size=Vector2(OS.get_window_size().x,OS.get_window_size().y)
signal animate
signal layer
signal hitZ


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	moveV()
	moveH()
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 420, screen_size.y)
	animate()
	move_and_slide(motion)
	setLayer()

func _physics_process(delta):
	pass

func moveV():
	if Input.is_action_just_pressed("punch"):
		motion.x=0
	elif Input.is_action_pressed("ui_right") && !Input.is_action_pressed("ui_left"):
		motion.x=SPEED
	elif Input.is_action_pressed("ui_left") && !Input.is_action_pressed("ui_right"):
		motion.x=-SPEED
	else:
		motion.x = 0

func moveH():
	if Input.is_action_just_pressed("punch"):
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


func _on_RayCast2D_colision(zombie,dgr):
	emit_signal("hitZ",zombie,dgr)
