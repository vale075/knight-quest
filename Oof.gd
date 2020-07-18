extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _process(delta):
	position.y+=5

func _on_Area2D_body_entered(body):
	if body.name=="player":
		get_tree().quit()
