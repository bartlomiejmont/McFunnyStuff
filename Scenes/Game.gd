extends Node2D

signal changeHP
signal changePoints
signal phone

var PlayerHP = 0
var Level = 1
var timer = 1
var points = 0
var pause = false

var zombies
var zombieTimer


func _ready():
	emit_signal("changeHP",PlayerHP)
	emit_signal("changePoints",points)
	zombies = $Zombies
	zombieTimer = $Timer

func _on_Player_hitPlayer():
	PlayerHP +=1
	emit_signal("changeHP",PlayerHP)

func _process(delta):
	if PlayerHP > 10:
		emit_signal("phone",points)


func _on_Level_timeout():
	timer *= 2
	$Level.wait_time = timer
	if timer >=128:
		zombies.zombieHP = 10 
		zombies.zombieSPEED = 250
		zombieTimer.wait_time = 1.5
	elif timer >= 64:
		zombies.zombieHP = 7 
		zombies.zombieSPEED = 200
		zombieTimer.wait_time = 2.2
	elif timer >= 32:
		zombies.zombieHP = 5 
		zombies.zombieSPEED = 190
		zombieTimer.wait_time = 2.5
	elif timer >= 16:
		zombies.zombieHP = 4 
		zombies.zombieSPEED = 170 

func _on_BScaleTimer_timeout():
	PlayerHP+=0.1
	emit_signal("changeHP",PlayerHP)


func _on_Zombies_addPoint():
	points+=1
	if PlayerHP > 0:
		PlayerHP-=0.3
	emit_signal("changeHP",PlayerHP)
	emit_signal("changePoints",points)
