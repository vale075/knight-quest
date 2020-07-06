extends StaticBody2D

var pv = float(13)
var finish = false
var activate=false

func _process(delta):
	if activate ==false:
		if finish == false:
			$Sprite2.scale.x= pv/13
		if pv == 0:
			$Sprite2.scale.x=0
			get_node("../..").over()
			activate=true
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			get_node("../../restartmenu/quit").visible=true
			get_node("../../restartmenu/recommencer").visible=true
			get_node("../../restartmenu/quit2").visible=true
			get_node("../../restartmenu/home2").visible=true
			get_node("../../restartmenu/home").visible=true
			get_node("../../restartmenu/Button").visibility()
			finish=true

func damage():
	pv-=1


func _on_Button_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	get_node("../../restartmenu/quit").visible=false
	get_node("../../restartmenu/recommencer").visible=false
	get_node("../../restartmenu/quit2").visible=false
	get_node("../../restartmenu/home2").visible=false
	get_node("../../restartmenu/home").visible=false
	pv = float(13)
	activate=false
	finish = false
	get_node("../../restartmenu/Button").visibility2()
	get_node("../..").oversound = false
