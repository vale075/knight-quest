extends Area2D

var vie = 7

func _process(delta):
	if get_parent().pause==false:
		position.y-= 1
		vie-=delta
		get_node("../../firerecharge/tale").scale.y = (7-vie)/7
		if vie < 0:
			get_parent().fire-=1
			queue_free()

func _ready():
	$Sprite/AnimationPlayer.play("basic")