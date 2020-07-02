extends StaticBody2D

var pv = float(13)
var finish = false

func _process(delta):
	if finish == false:
		$Sprite2.scale.x= pv/13
	if pv == 0:
		$Sprite2.scale.x=0
		get_node("../..").overtu()

func damage():
	pv-=1


func _on_Button_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	get_node("../../restartmenu/quit").visible=false
	get_node("../../restartmenu/recommencer").visible=false
	get_node("../../restartmenu/quit2").visible=false
	get_node("../../restartmenu/home2").visible=false
	get_node("../../restartmenu/home").visible=false
	finish = false
	pv = float(13)
	get_node("../../restartmenu/Button").visibility2()
	get_node("../..").oversound = false
