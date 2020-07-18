extends Node

var pause=false
var enemyspeed= 8
var finish = false
var enemi = 0
var enemylife=0
var activate =false
var load0=load("res://0_leet_easter.tscn")
var load1=load("res://1_leet_easter.tscn")
var loadE=load("res://E_leet_easter.tscn")
var loadL=load("res://L_leet_easter.tscn")
var loadT=load("res://T_leet_easter.tscn")


func _on_Timer_timeout():
	var typeenemy= randi()%5
	if enemi <500:
		if pause == false:
			enemyspeed+=0.01
			if typeenemy == 0:
				var enemy = load0.instance()
				enemy.speed=enemyspeed
				enemy.position.x = rand_range(50,950)
				enemylife+=1
				enemi+=1
				add_child(enemy)
			elif typeenemy==1:
				var enemy = load1.instance()
				enemy.speed=enemyspeed
				enemy.position.x = rand_range(50,950)
				enemylife+=1
				enemi+=1
				add_child(enemy)
			elif typeenemy==2 :
				var enemy = loadE.instance()
				enemy.speed=enemyspeed
				enemy.position.x = rand_range(50,950)
				enemylife+=1
				enemi+=1
				add_child(enemy)
			elif typeenemy==3 :
				var enemy = loadL.instance()
				enemy.speed=enemyspeed
				enemy.position.x = rand_range(50,950)
				enemylife+=1
				enemi+=1
				add_child(enemy)
			else:
				var enemy = loadT.instance()
				enemy.speed=enemyspeed
				enemy.position.x = rand_range(50,950)
				enemylife+=1
				enemi+=1
				add_child(enemy)
			if not get_node("../sond/musique").pitch_scale<0.05:
				get_node("../sond/musique").pitch_scale+=0.001

func _on_Button_pressed():
	enemi=0
	enemylife=0
	finish = false
	enemyspeed=8
	get_node("../sond/musique").pitch_scale=1
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
		if enemi >499:
			if enemylife==0:
				get_parent().end()
				activate=true

func _on_main_pause():
	pause=true


func _on_main_unpause():
	pause=false