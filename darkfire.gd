extends KinematicBody2D

signal damage()
var speed=0
var finish = false
var finishhim = false
signal animationfinish
var loadfire=load("res://darkfire.tscn")

func _ready():
	$Sprite/AnimationPlayer.play("boomer")
	$Timer.wait_time=rand_range(0.5,1.5)

func _process(delta):
	if finishhim == false:
		if get_parent().pause==false:
			position.y+=  speed/3
	if get_parent().pause==false:
		$Sprite/AnimationPlayer.play("boomer")
	else:
		$Sprite/AnimationPlayer.stop(false)

func _on_Area2D_body_entered(body):
	if body.name == "player":
		if $"../../mur/base".finish ==false:
			get_node("../../scorenode").enemykill(position)
			get_node("../../playernode/player").attack = true
			get_node("../../playernode/player").timer = 0
			get_node("../..").kill()
			queue_free()
	elif body.name == "base":
		if $"../../mur/base".finish ==false:
			get_node("../../scorenode").enemykill(position)
			get_node("../../playernode/player").attack = true
			get_node("../../playernode/player").timer = 0
			get_node("../..").kill()
			queue_free()
		else :
			finishhim=true

func _on_Area2D_area_entered(area):
	if "fireball" in area.name:
		get_node("../../scorenode").enemykill(position)
		get_node("../..").kill()
		queue_free()



func _on_Timer_timeout():
	if get_parent().pause == false:
		var fire=loadfire.instance()
		fire.position=position
		fire.speed=speed
		get_parent().add_child(fire)
