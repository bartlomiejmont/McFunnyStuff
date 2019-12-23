extends Label

var textToAdd
var tx
var keyClick
var i = 0
var playing = false

func _ready():
	keyClick = get_parent().get_parent().get_parent().get_parent().get_node("keybord")
	self.text = ""
	textToAdd = [
	"Wcielasz sie w role Bernarda ktory probuje \npowstrzymac bezmuzgich kierowcow BMW",
	"Bernard nie lubi czekac i nie lubi jak ktos go dotyka",
	"Uspokaja go widok nieprzytomnego dresa",
	"Nie mozesz pozwolic Bernardowi osiagnac maksimum wkorwienia", 
	"Poruszasz sie strzalkami, atakujesz spacja a ESC zatrzymuje czas",
	]

func printText(text):
	#create a timer to print text like a typewriter
	var t = Timer.new()
	t.set_wait_time(.1)
	t.set_one_shot(true)
	self.add_child(t)
	
	keyClick.play()
	for letter in text[i]:
		t.start()
		tx = self.text
		self.text = tx + letter
		yield(t, "timeout")
	keyClick.stop()
	playing = false

func _on_TextureButton_pressed():
	if playing == false:
		playing = true
		if i >= textToAdd.size():
			yield(get_tree().create_timer(0.3), "timeout")
			get_tree().change_scene("res://Scenes/Game.tscn")
		else:
			self.text = ""
			printText(textToAdd)
			i+=1
