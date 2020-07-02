extends Sprite

func _process(delta):
	if scale.y < 1:
		scale.y += delta/7