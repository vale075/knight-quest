extends KinematicBody2D

signal damage()
var speed=0
var finish = false
var finishhim = false
signal animationfinish
var dead = false


func _physics_process(delta):
	if finishhim == false:
		if get_parent().pause==false:
			if dead == false:
				position.y+=  speed

func _on_Area2D_body_entered(body):
	if body.name == "player":
		if $"../../mur/base".finish ==false:
			$CollisionShape2D.queue_free()
			$Area2D/CollisionShape2D.queue_free()
			$Sprite.visible=false
			get_node("../../mur/base").damage()
			get_node("../../scorenode").basetouch()
			get_node("../..").hit()
			$Sprite2.visible=true
			$Sprite2/AnimationPlayer.play("explosion")
			yield(self, "animationfinish")
			get_node("../..").touch()
			queue_free()
	elif body.name == "base":
		if $"../../mur/base".finish ==false:
			get_node("../../scorenode").enemykill(position)
			get_node("../../playernode/player").attack = true
			get_node("../../playernode/player").timer = 0
			get_node("../..").kill()
			queue_free()
		else :
			finishhim=true

func _on_Area2D_area_entered(area):
	if "fireball" in area.name:
		$CollisionShape2D.queue_free()
		$Area2D/CollisionShape2D.queue_free()
		get_node("../../scorenode").enemykill(position)
		get_node("../..").kill()
		queue_free()


func _on_AnimationPlayer_animation_finished(anim_name):
	emit_signal("animationfinish")
