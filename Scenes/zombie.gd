extends CanvasLayer

onready var zb=get_node("Area2D")
onready var HpText=get_node("Area2D/ZombieHP")
onready var Player = get_node("../../CanvasLayer/Player")
var HP 
var SPEED = 150
var motion = Vector2()
var screen_size=Vector2(OS.get_window_size().x,OS.get_window_size().y)
var right = true;
var isHit = false
signal animateZ



func _ready():
	self.layer=1
	HP=3
	HpText.text=str(HP)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move()
	zb.position += motion * delta
	zb.position.x = clamp(zb.position.x, 0, screen_size.x)
	zb.position.y = clamp(zb.position.y, 420, screen_size.y)
	if HP<=0:
		queue_free()
	layer = zb.position.y/10-1
	HpText.text=str(HP)

func move():
	if not isHit:
		if Player.position.x > zb.position.x:
			motion.x+=5
			right=true
			emit_signal("animateZ",right)
		if Player.position.x < zb.position.x:
			motion.x-=5
			right=false
			emit_signal("animateZ",right)
		if Player.position.y > zb.position.y:
			motion.y+=5
		if Player.position.y < zb.position.y:
			motion.y-=5
		if motion.length()>0:
			motion = motion.normalized() * SPEED

func _on_Zombies_slowDown():
	SPEED =  SPEED/2
