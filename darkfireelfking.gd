extends KinematicBody2D

signal damage()
var finish = false
var finishhim = false
signal animationfinish
var dead = false
var time = 10

func _physics_process(delta):
	if finishhim == false:
		if get_node("../..").pause==false:
			if dead == false:
				position.y-=1
				if get_node("../Node2D").position.x >position.x:
					position.x+=1
				else:
					position.x-=1
	time-=delta
	if time < 0:
		queue_free()



func _on_Area2D_area_entered(area):
	if area.name == "king":
		get_node("../Node2D").vie -=1
		queue_free()
