extends CanvasLayer

var pause
var phone
var point
var number
var call
var dead

var endGameNode
var scoreEnd


func _ready():
	pause = false
	phone = get_node("Phone")
	number = get_node("Phone/number")
	endGameNode = preload("res://Scenes/GameOver.tscn").instance()
	scoreEnd = endGameNode.get_node("VBoxContainer/HBoxContainer2/Score")
	call = self.get_node("Phone/AudioStreamPlayer4")
	dead = self.get_node("Phone/AudioStreamPlayer5")


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
	dead.play()


func _on_Button2_pressed():
	if number.text == "911":
		call.play()
		yield(get_tree().create_timer(8), "timeout")
		scoreEnd.text = scoreEnd.text + String(point)
		get_tree().get_root().add_child(endGameNode)
