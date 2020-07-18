extends KinematicBody2D

var speed=0
var time = 7.0
# Called when the node enters the scene tree for the first time.
func _process(delta):
	if get_parent().pause==false:
		time-=delta
		position.y+=speed
		if time <0:
			get_parent().enemylife-=1
			queue_free()

func _on_Area2D_body_entered(body):
	if body.name == "player":
		get_node("../..").over()
		get_parent().enemylife-=1
		queue_free()
