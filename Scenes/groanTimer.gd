extends Timer

onready var g1 = get_node("../groan1")
onready var g2 = get_node("../groan2")
onready var g3 = get_node("../groan3")
onready var g4 = get_node("../groan4")

var pitch = 1.0
var g

onready var groans = [g1,g2,g3,g4]

func _ready():
	g = groans[randi()%4]
	pitch = rand_range(0.85,1.15)
	g.pitch_scale = pitch
	g.play()