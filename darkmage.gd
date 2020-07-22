extends KinematicBody2D

signal damage()
var speed=0
var finish = false
var finishhim = false
signal animationfinish
var dead = false
var time = 15.0

func _physics_process(delta):
	if finishhim == false:
		if get_node("..").pause==false:
			if dead == false:
				position.y+=speed*2
				if get_node("../../playernode/player").position.x >position.x:
					position.x+=speed/3
				else:
					position.x-=speed/3
	time-=delta
	if time<0:
		queue_free()

func _on_Area2D_body_entered(body):
	if body.name == "player":
		if $"../../mur/base".finish ==false:
			get_node("../../mur/base").damage()
			get_node("../../scorenode").basetouch()
			get_node("../..").hit()
			queue_free()
	elif body.name == "base":
		queue_free()
