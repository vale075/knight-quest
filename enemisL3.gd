extends Node

var pause=false
var enemyspeed= 5
var finish = false
var enemi = 0
var enemylife=0
var activate =false

func _on_Timer_timeout():
	if enemi <40:
		if pause == false:
			enemyspeed+=0.05
			var enemy = load("res://enemy2.tscn").instance()
			enemy.speed=enemyspeed
			enemy.position.x = get_node("../playernode/player").position.x
			enemylife+=1
			enemi+=1
			add_child(enemy)

func _on_Button_pressed():
	enemi=0
	enemylife=0
	finish = false
	enemyspeed=1
	for n in get_children():
		if n.name != "Timer":
			remove_child(n)
			n.queue_free()

func _process(delta):
	if finish==true:
		for n in get_children():
			if n.name != "Timer":
				get_node(n.name).finish=true
	if activate == false:
		if enemi >39:
			if enemylife==0:
				get_parent().end()
				activate=true

func _on_main_pause():
	pause=true


func _on_main_unpause():
	pause=false
