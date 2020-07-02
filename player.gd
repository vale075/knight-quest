extends KinematicBody2D

export var speed = 250
var hit = false
var finish = false
var attack=false
var timer=0
var pause=false

func _process(delta):
	if pause == false:
		if finish == false:
			var velocity = Vector2()
			if Input.is_action_pressed("ui_right"):
				velocity.x += 1
			if Input.is_action_pressed("ui_left"):
				velocity.x -= 1
			if Input.is_action_pressed("ui_down"):
				velocity.y += 1
			if Input.is_action_pressed("ui_up"):
				velocity.y -= 1
			move_and_slide(velocity*speed)
			if attack==false:
				if velocity!=Vector2():
					$AnimationTreePlayer.play("walk")
					$walk.visible=true
					$idle.visible=false
					$loose.visible=false
					$fight.visible=false
				else:
					$AnimationTreePlayer.play("idle")
					$walk.visible=false
					$idle.visible=true
					$loose.visible=false
					$fight.visible=false
			else:
				timer+=delta
				$AnimationTreePlayer.play("fight")
				$walk.visible=false
				$idle.visible=false
				$loose.visible=false
				$fight.visible=true
				if timer>0.5:
					attack=false
		else:
			$AnimationTreePlayer.play("loose")
			$walk.visible=false
			$idle.visible=false
			$loose.visible=true
			$fight.visible=false

func _on_Button_pressed():
	finish = false


func _on_main_pause():
	pause=true


func _on_main_unpause():
	pause=false
