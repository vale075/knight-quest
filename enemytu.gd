extends KinematicBody2D

signal damage()
var speed=0
var finish = false
var finishhim = false

func _physics_process(delta):
	if finishhim == false:
		if get_parent().pause==false:
			position.y+=  speed
	if get_parent().pause==false:
		$Sprite/AnimationPlayer.play("boomer")
	else:
		$Sprite/AnimationPlayer.stop(false)

func _on_Area2D_body_entered(body):
	if body.name == "player":
		if finish ==false:
			get_node("../scorenode").enemykill(position)
			get_node("../playernode/player").attack = true
			get_node("../playernode/player").timer = 0
			get_node("..").killtu()
			queue_free()
	elif body.name == "base":
		if finish == true:
			finishhim=true
		else:
			get_node("../mur/base").damage()
			get_node("../scorenode").basetouch()
			get_node("..").damagetu()
			get_node("..").hit()
			queue_free()

func _on_Area2D_area_entered(area):
	if "fireball" in area.name:
		get_node("../scorenode").enemykill(position)
		get_node("..").killtu()
		queue_free()
