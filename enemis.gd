extends Node

var pause=false
var enemyspeed= 1
var finish = false
var enemi = 0
var enemylife=0
var activate =false

func _on_Timer_timeout():
	if enemi <15:
		if pause == false:
			enemyspeed+=0.01
			var enemy = load("res://enemy.tscn").instance()
			enemy.speed=enemyspeed
			enemy.position.x = rand_range(50,950)
			enemylife+=1
			enemi+=1
			add_child(enemy)

func _on_Button_pressed():
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
		if enemi >14:
			if enemylife==0:
				if $"../mur/base".pv < 6:
					activate=true
					

func _on_main_pause():
	pause=true


func _on_main_unpause():
	pause=false
