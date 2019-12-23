extends AudioStreamPlayer2D

var pitch = 1.0

func _on_ough_finished():
	pitch = rand_range(1,1.3)
	pitch_scale = pitch
