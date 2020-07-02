extends Node

var score = 0
var finish = false
var combo = 0
var begin=false

func _process(delta):
	if begin ==true:
		if finish == false:
			get_node("score").text= str(score)
			get_node("combo").text=str("X" , combo)
		else:
			get_node("score").text= "GAME OVER  "+ str(score)

func _on_Button_pressed():
	finish = false
	score = 0

func enemykill(varposition):
	if finish == false:
		var scorelabel = load("res://labelscore.tscn").instance()
		scorelabel.texte=str((combo*100) + 500)
		scorelabel.position=varposition
		add_child(scorelabel)
		score += (combo*100) + 500
		combo += 1

func basetouch():
	combo = 0
