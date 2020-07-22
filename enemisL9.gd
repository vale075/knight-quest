extends Node

var pause=false
var enemyspeed= 2
var finish = false
var enemi = 0
var enemylife=0
var activate =false
var load1=load("res://enemy.tscn")
var load2=load("res://enemy2.tscn")
var loadlight=load("res://lightcanon.tscn")
var loadlove=load("res://love.tscn")
var loadmana=load("res://mana.tscn")
var loaddark=load("res://darkmage.tscn")

func _on_Timer_timeout():
	var typeenemy= randi()%8
	if enemi <300:
		if pause == false:
			enemyspeed+=0.01
			if typeenemy == 0 or typeenemy==3:
				var enemy = load1.instance()
				enemy.speed=enemyspeed
				enemy.position.x = rand_range(50,950)
				enemylife+=1
				enemi+=1
				add_child(enemy)
			elif typeenemy==2 or typeenemy==1:
				var enemy = load2.instance()
				enemy.speed=enemyspeed
				enemy.position.x = rand_range(50,950)
				enemylife+=1
				enemi+=1
				add_child(enemy)
			elif typeenemy==4:
				var enemy = loadlove.instance()
				enemy.speed=enemyspeed
				enemy.position.x = rand_range(50,950)
				add_child(enemy)
			elif typeenemy==5:
				var enemy = loadmana.instance()
				enemy.speed=enemyspeed
				enemy.position.x = rand_range(50,950)
				add_child(enemy)
			elif typeenemy==6:
				var enemy = loaddark.instance()
				enemy.speed=enemyspeed
				enemy.position.x = rand_range(50,950)
				enemylife+=1
				enemi+=1
				add_child(enemy)
			else :
				var enemy = loadlight.instance()
				enemy.position.x = rand_range(50,950)
				enemylife+=1
				enemi+=1
				add_child(enemy)

func _on_Button_pressed():
	enemi=0
	enemylife=0
	finish = false
	enemyspeed=2
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
		if enemi >299:
			if enemylife==0:
				get_parent().end()
				activate=true

func _on_main_pause():
	pause=true


func _on_main_unpause():
	pause=false