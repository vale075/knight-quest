extends KinematicBody2D

var vie = 30
var loadattack=load("res://kingattackII.tscn")
var finish = false
var activate =false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite/AnimationPlayer.play("fight")



func _on_Area2D_area_entered(area):
	if visible==true:
		if "fireball" in area.name:
			if visible==true:
				vie-=1

func _on_Timer_timeout():
	if visible==true:
		if get_node("../..").pause==false:
			position.x = get_node("../../playernode/player").position.x
			var fire=loadattack.instance()
			fire.position=position
			get_parent().add_child(fire)


func _on_Button_pressed():
	finish = false
	vie=30
	
func _process(delta):
	if vie < 0:
		if activate == false:
			if get_node("../..").oversound==false:
				activate = true
				get_node("../..").end()