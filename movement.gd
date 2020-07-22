extends Node

var speed=0
var finish = false
var finishhim = false
signal animationfinish
var dead = false

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	if finishhim == false:
		if get_parent().pause==false:
			if dead == false:
				position.y+=  speed/3