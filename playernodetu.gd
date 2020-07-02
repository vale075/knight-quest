extends Node

var pause=false
var fireball = load("fireball.tscn")
var fire = 0
var finish = false
var fireactive = false

func _process(delta):
	if finish == false:
		if Input.is_action_just_pressed("fire"):
			if fireactive == true:
				if pause==false:
					fire()

func fire():
	if fire < 1:
		var fireballl=fireball.instance()
		fireballl.position=$player.position
		add_child(fireballl,true)
		fire+=1
	if fire<0:
		fire=1

func _on_Button_pressed():
	finish = false
	fire = 0


func _on_main_pause():
	pause=true

func _on_main_unpause():
	pause=false
