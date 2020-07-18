extends Node2D

var positionvar=0
var activate = false
var time = 0
var something=false
var somebody=""

func _process(delta):
	if positionvar<50:
		positionvar+=1
		position.y+=1
	else:
		time+=delta
		if activate == false:
			activate=true
			$lightcanon/Sprite/AnimationPlayer.play("fire")
		if time > 3.2:
			get_node("../..").kill()
			queue_free()
		if time>1:
			if something==true:
				sure()


func _on_lightcanon_body_entered(body):
	something=true
	somebody=body.name
	if time > 1:
		if body.name == "player":
			get_node("../../mur/base").damage()
			get_node("../../mur/base").damage()
			get_node("../../mur/base").damage()
			get_node("../../scorenode").basetouch()
			get_node("../..").hit()
			queue_free()

func sure():
	something=false
	if somebody=="player":
		get_node("../../mur/base").damage()
		get_node("../../mur/base").damage()
		get_node("../../mur/base").damage()
		get_node("../../scorenode").basetouch()
		get_node("../..").hit()
		queue_free()

func _on_lightcanon_body_exited(body):
	something=false
