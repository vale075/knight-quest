extends Node

var pause=true
var finish = false

func _process(delta):
	if finish==true:
		for n in get_children():
			if n.name != "Timer":
				get_node(n.name).finish=true

func _on_main_pause():
	pause=true


func _on_main_unpause():
	pause=false
