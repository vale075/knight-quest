extends Node2D

var speed=0
var time = 15.0


func _process(delta):
	position.y+=speed/2
	time-=delta
	if time < 0:
		queue_free()

func _on_Area2D_body_entered(body):
	if body.name =="player":
		get_node("../../playernode").fire-=1
		get_node("../../playernode").fire()
		get_node("../../mur/base").heal()
		queue_free()