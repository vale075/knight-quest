extends Area2D

var vie = 15

func _process(delta):
	if get_parent().pause==false:
		position.y-= 3
		vie-=delta
		get_node("../../firerecharge/tale").scale.y = (15-vie)/15
		if vie < 0:
			get_parent().fire-=1
			queue_free()

func _ready():
	$Sprite/AnimationPlayer.play("basic")