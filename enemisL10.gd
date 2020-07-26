extends Node

var pause=false
var enemyspeed= 2.0
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
var loadstar=load("res://star.tscn")
signal timer_end

func _wait( seconds ):
	self._create_timer(self, seconds, true, "_emit_timer_end_signal")

func _emit_timer_end_signal():
	emit_signal("timer_end")

func _create_timer(object_target, float_wait_time, bool_is_oneshot, string_function):
	var timer = Timer.new()
	timer.set_one_shot(bool_is_oneshot)
	timer.set_timer_process_mode(0)
	timer.set_wait_time(float_wait_time)
	timer.connect("timeout", object_target, string_function)
	self.add_child(timer)
	timer.start()

func _on_Timer_timeout():
	var typeenemy= randi()%8
	if enemi <500:
		if pause == false:
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
				enemi+=1
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
			else:
				var enemy = loadstar.instance()
				enemy.speed=enemyspeed
				enemy.position.x = rand_range(50,950)
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
		if enemi >499:
			_wait(5)
			yield(self,"timer_end")
			get_parent().end()
			activate=true

func _on_main_pause():
	pause=true


func _on_main_unpause():
	pause=false