extends CanvasLayer

var pause
var phone
var point
var number

var endGameNode
var scoreEnd

signal endGame

func _ready():
	pause = false
	phone = get_node("Phone")
	number = get_node("Phone/number")
	endGameNode = preload("res://Scenes/GameOver.tscn").instance()
	scoreEnd = endGameNode.get_node("VBoxContainer/HBoxContainer2/Score")


func _on_Game_phone(point):
	self.point=point
	var t = Timer.new()
	t.set_wait_time(.5)
	t.set_one_shot(true)
	self.add_child(t)
	
	t.start()
	yield(t, "timeout")
	
	get_tree().paused = true
	pause = true
	phone.visible = true


func _on_Button2_pressed():
	if number.text == "911":
		scoreEnd.text = scoreEnd.text + String(point)
		get_tree().get_root().add_child(endGameNode)
