extends TextureProgress

var tween

func _ready():
	self.value=0
	tween = self.get_parent().get_node("Tween")


func _on_HUD_labelHP(HP):
	tween.interpolate_property(self,"value",self.value,HP,0.4, Tween.TRANS_SINE, Tween.EASE_OUT)
	tween.start()
