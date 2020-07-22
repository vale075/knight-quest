extends KinematicBody2D

var loadattack=load("res://kingattackIIteam.tscn")
var finish = false
var activate =false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite/AnimationPlayer.play("fight")

func _on_Timer_timeout():
	if visible==true:
		if get_node("../..").pause==false:
			position.x = get_node("../Node2D").position.x
			var fire=loadattack.instance()
			fire.position=position
			get_parent().add_child(fire)
