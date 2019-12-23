extends Label


var textToAdd
var tx
var song
var i = 0
var playing = false

func _ready():
	song = get_parent().get_node("EndSong")
	self.text = ""
	textToAdd = [
	"Uczcijmy minuta ciszy pamiec wszystkich poległych",
	"Rozmawiajmy zamiast oddalac sie od siebie",
	"Badzmy szczerzy, mili i otwarci na innych",
	"Ale przede wszystkim wybaczajmy sobie nawzajem",
	"Nie sprawiajmy innym przykrosci tylko sobie pomagajmy",
	"Wróc do nas Adam :,(",
	]
	yield(get_tree().create_timer(2), "timeout")
	for x in range(0,textToAdd.size()):
		printText(textToAdd[x])
		yield(get_tree().create_timer(8), "timeout")

func printText(text):
	#create a timer to print text like a typewriter
	var t = Timer.new()
	t.set_wait_time(.05)
	t.set_one_shot(true)
	self.add_child(t)
	
	for letter in text:
		t.start()
		tx = self.text
		self.text = tx + letter
		yield(t, "timeout")
	self.text=self.text+"\n"
