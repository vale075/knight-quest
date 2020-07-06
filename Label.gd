extends Label


var fps=0
# Called when the node enters the scene tree for the first time.
func _process(delta):
	fps+=1
	print(fps)

func _on_Timer_timeout():
	text=str(fps)
	fps=0

