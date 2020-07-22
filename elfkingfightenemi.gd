extends Node2D

var loadfire=load("res://darkfireelfkingenemy.tscn")
var vie = 15

func go():
	$Timer.start()
	$Sprite/AnimationPlayer.play("fire")

func _on_Timer_timeout():
	position.x=get_node("../../playernode/player").position.x
	var fire = loadfire.instance()
	fire.position=position
	fire.speed=2.0
	get_parent().add_child(fire)
	$Timer.start()
	


func _on_Area2D_area_entered(area):
	if "fireball" in area.name or "Area2D" in area.name:
		vie-=1

func _process(delta):
	if vie <0:
		get_node("../..").end()
		get_node("../king").queue_free()
		queue_free()

func _on_main_pause():
	$Sprite/AnimationPlayer.stop(false)
	$Timer.paused=true


func _on_main_unpause():
	$Sprite/AnimationPlayer.play("fire")
	$Timer.paused=false


func _on_Button_pressed():
	vie=15
