extends Node

var damage = false
var timer=0

func _process(delta):
	timer+=delta
	if timer> 0.1:
		$camdam.current=false
		$cambase.current=true

func damage():
	damage =true
	timer=0
	$cambase.current=false
	$camdam.current=true