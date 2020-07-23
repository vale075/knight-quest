extends Node2D

var speed=0
var time = 15.0

func _ready():
	$Sprite/AnimationPlayer.play("mana")

func _process(delta):
	if get_parent().pause==false:
		position.y+=speed/2
		time-=delta
	if time < 0:
		queue_free()
	if get_parent().pause==false:
		$Sprite/AnimationPlayer.play("boomer")
	else:
		$Sprite/AnimationPlayer.stop(false)

func _on_Area2D_body_entered(body):
	if body.name =="player":
		get_node("../../playernode").fire-=1
		get_node("../../playernode").fire()
		queue_free()