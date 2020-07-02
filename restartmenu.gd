extends Node

func _on_Button_mouse_entered():
	$Button.icon=load("res://texture/knight quest/replay2.png")

func _on_Button_mouse_exited():
	$Button.icon=load("res://texture/knight quest/replay1.png")

func _on_quit_pressed():
	get_tree().quit()


func _on_home_pressed():
	get_tree().change_scene("menu.tscn")


func _on_home_mouse_entered():
	$home.icon=load("res://texture/static/home2.png")


func _on_home_mouse_exited():
	$home.icon=load("res://texture/static/home.png")

func _on_unpause_mouse_entered():
	$unpause.icon=load("res://texture/static/unpause2.png")


func _on_unpause_mouse_exited():
	$unpause.icon=load("res://texture/static/unpause.png")


func _on_quitb_mouse_entered():
	$quitb.icon=load("res://texture/static/quit2.png")


func _on_quitb_mouse_exited():
	$quitb.icon=load("res://texture/static/quit.png")