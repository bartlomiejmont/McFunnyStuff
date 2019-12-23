extends Label

var t
var endT = ["9","1","1"]

func _ready():
	t = ""
	self.text = t

func _on_Button_pressed():
	if not endT.empty():
		t = t+endT.front()
		endT.pop_front()
		self.text = t
