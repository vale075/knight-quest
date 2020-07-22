extends Node2D

var loadfire=load("res://darkfireelfking.tscn")

func go():
	$Timer.start()
	$Sprite/AnimationPlayer.play("fire")

func _on_Timer_timeout():
	position.x=get_node("../Node2D").position.x
	var fire = loadfire.instance()
	fire.position=position
	get_parent().add_child(fire)
	$Timer.start()
	
