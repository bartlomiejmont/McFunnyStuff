extends Node

signal slowDown
signal addPoint
export (PackedScene) var Enemy

var rng = RandomNumberGenerator.new()
var screen_size=Vector2(OS.get_window_size().x,OS.get_window_size().y)

func _ready():
	pass

func _on_Player_hitZ(z,dgr):
	var zombie = z.get_owner()
	print("hit:", zombie)
	if zombie.HP == 1:
		emit_signal("addPoint")
	zombie.HP-=1
	if dgr == 270:
		zombie.get_child(0).position.x+=40
	else:
		zombie.get_child(0).position.x-=40
	zombie.SPEED = zombie.SPEED/2
	emit_signal("slowDown")


func spawnZombie():
	rng.randomize()
	var enemy = Enemy.instance()
	var randY = rng.randi_range(420, screen_size.y)
	var lefrOrRight = rng.randi_range(0,1)
	enemy.get_child(0).position.y = randY
	if lefrOrRight == 1:
		enemy.get_child(0).position.x = screen_size.x
	else:
		enemy.get_child(0).position.x = 0
	add_child(enemy)
	print("spawn:" , enemy)

func _on_Timer_timeout():
	spawnZombie()
