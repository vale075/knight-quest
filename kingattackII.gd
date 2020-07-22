extends Node2D

var time = 10

func _process(delta):
	if get_node("../..").pause==false:
		position.y+=3
		time-=delta
		if time < 0:
			queue_free()


func _on_Area2D_body_entered(body):
	if body.name == "player":
		if get_node("../Node2D").finish==false:
			get_node("../..").over()
			get_node("../Node2D").finish=true
