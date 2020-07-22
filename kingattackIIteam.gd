extends Node2D

var time = 10

func _process(delta):
	if get_node("../..").pause==false:
		position.y-=3
		time-=delta
		if time < 0:
			queue_free()

