extends KinematicBody2D

var texte=""

func _on_Timer_timeout():
	queue_free()

func _ready():
	get_node("labelscore").text=texte

func _process(delta):
	position.y-=1