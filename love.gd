extends KinematicBody2D

signal damage()
var speed=0
var finish = false
var finishhim = false
signal animationfinish
var good = true
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

func _physics_process(delta):
	if finishhim == false:
		if get_parent().pause==false:
			if good == true:
				position.y+=  speed
			else:
				if get_node("../../playernode/player").position.y > position.y :
					position.y+=  speed/3
				else:
					position.y-=  speed/3
				if get_node("../../playernode/player").position.x > position.x:
					position.x += speed/3
				else:
					position.x -= speed/3

func _on_Area2D_body_entered(body):
	if body.name == "player":
		if $"../../mur/base".finish ==false:
			if good == true:
				get_node("../../mur/base").heal()
				$Area2D.queue_free()
				$Sprite.queue_free()
				$CollisionShape2D.queue_free()
				$good.play()
				_wait(2)
				yield(self,"timer_end")
				get_parent().enemylife-=1
				queue_free()
			else:
				get_node("../../mur/base").damage()
				get_node("../../scorenode").basetouch()
				get_node("../..").hit()
				get_parent().enemylife-=1
				queue_free()
	elif body.name == "base":
		if $"../../mur/base".finish ==false:
			$Sprite.texture=load("res://texture/knight quest/lovebad.png")
			$bad.play()
			good=false
		else :
			finishhim=true

func _on_Area2D_area_entered(area):
	if good==true:
		if "fireball" in area.name:
			$Sprite.texture=load("res://texture/knight quest/lovebad.png")
			$bad.play()
			good=false


func _on_AnimationPlayer_animation_finished(anim_name):
	emit_signal("animationfinish")
