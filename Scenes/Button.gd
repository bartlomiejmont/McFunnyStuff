extends Button

var i = 1

onready var a1 = self.get_parent().get_node("AudioStreamPlayer")
onready var a2 = self.get_parent().get_node("AudioStreamPlayer2")
onready var a3 = self.get_parent().get_node("AudioStreamPlayer3")

func _on_Button_pressed():
	if i == 1:
		a1.play()
	elif i == 2:
		a2.play()
	elif i == 3:
		a3.play()
	i+=1
