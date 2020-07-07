extends Node

var fullscreen=true
var sound=7
var up = false
var down=false
var left=false
var right=false
var pause=false
var fire=false
var accept = false
var levelsave = ""

func _ready():
	$menumusic.play()
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -20+(2*7))

func _on_start_mouse_entered():
	$start.icon=load("res://texture/knight quest/replay2.png")

func _on_start_mouse_exited():
	$start.icon=load("res://texture/knight quest/replay1.png")

func _on_start_pressed():
	$start.visible=false
	$quit.visible=false
	$start2.visible=false
	$quit2.visible=false
	$_return.visible=true
	$return2.visible=true
	$_continue.visible=true
	$continue2.visible=true
	$begin.visible=true
	$begin2.visible=true

func _on__return_mouse_entered():
	$_return.icon=load("res://texture/static/return2.png")


func _on__return_mouse_exited():
	$_return.icon=load("res://texture/static/return1.png")


func _on__return_pressed():
	$start.visible=true
	$quit.visible=true
	$start2.visible=true
	$quit2.visible=true
	$_return.visible=false
	$return2.visible=false
	$_continue.visible=false
	$continue2.visible=false
	$begin.visible=false
	$begin2.visible=false
	$sound.visible=false
	$sound2.visible=false
	$bonus.visible=false
	$malus.visible=false
	$fullscreen.visible=false
	$fullscreen2.visible=false
	$control2/upbutton.visible=false
	$control2/up.visible=false
	$control2/leftbutton.visible=false
	$control2/left.visible=false
	$control2/rightbutton.visible=false
	$control2/right.visible=false
	$control2/firebutton.visible=false
	$control2/fire.visible=false
	$control2/downbutton.visible=false
	$control2/down.visible=false
	$control2/pausebutton.visible=false
	$control2/pause.visible=false
	$"control2/acceptbutton".visible=false
	$"control2/accept".visible=false

func _on__continue_mouse_entered():
	$_continue.icon=load("res://texture/static/continue2.png")


func _on__continue_mouse_exited():
	$_continue.icon=load("res://texture/static/continue.png")


func _on__continue_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	get_tree().change_scene("res://level1.tscn")


func _on_begin_mouse_entered():
	$begin.icon=load("res://texture/static/begin2.png")


func _on_begin_mouse_exited():
	$begin.icon=load("res://texture/static/begin.png")


func _on_begin_pressed():
	var save_game = File.new()
	save_game.open("res://save/save.tres", File.READ)
	if not save_game == Object():
		for i in save_game:
			if "res" in i:
				levelsave = i
		get_tree().change_scene(levelsave)
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _on_quit_pressed():
	get_tree().quit()


func _on_quit_mouse_entered():
	$quit.icon=load("res://texture/static/quit2.png")


func _on_quit_mouse_exited():
	$quit.icon=load("res://texture/static/quit.png")


func _on_option_mouse_entered():
	$option.icon=load("res://texture/static/option2.png")


func _on_option_mouse_exited():
	$option.icon=load("res://texture/static/option.png")


func _on_option_pressed():
	$start.visible=false
	$quit.visible=false
	$start2.visible=false
	$quit2.visible=false
	$_return.visible=true
	$return2.visible=true
	$_continue.visible=false
	$continue2.visible=false
	$begin.visible=false
	$begin2.visible=false
	$sound.visible=true
	$sound2.visible=true
	$bonus.visible=true
	$malus.visible=true
	$fullscreen.visible=true
	$fullscreen2.visible=true
	$fullscreen.pressed=OS.is_window_fullscreen()
	$sound.frame=sound
	$control2/upbutton.visible=false
	$control2/up.visible=false
	$control2/leftbutton.visible=false
	$control2/left.visible=false
	$control2/rightbutton.visible=false
	$control2/right.visible=false
	$control2/firebutton.visible=false
	$control2/fire.visible=false
	$control2/downbutton.visible=false
	$control2/down.visible=false
	$control2/pausebutton.visible=false
	$control2/pause.visible=false
	$"control2/acceptbutton".visible=false
	$"control2/accept".visible=false

func soundchanged():
	if sound < 0:
		sound=0
	elif sound > 18:
		sound = 18
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -20+(2*sound))
	$soundtest.play()
	$sound.frame=sound

func _on__pressed():
	sound+=1
	soundchanged()


func _on_malus_pressed():
	sound-=1
	soundchanged()


func _on_menumusic_finished():
	$menumusic.play()


func _on_fullscreen_pressed():
	if fullscreen==true:
		OS.set_window_fullscreen(false)
		fullscreen=false
		OS.set_borderless_window(false)
		$fullscreen.icon=load("res://texture/static/fullscreenfalse.png")
	else :
		OS.set_window_fullscreen(true)
		fullscreen=true
		OS.set_borderless_window(true)
		$fullscreen.icon=load("res://texture/static/fullscrenntrue.png")


func _on_fullscreen_mouse_entered():
	if fullscreen==true:
		$fullscreen.icon=load("res://texture/static/fullscrenntrue2.png")
	else:
		$fullscreen.icon=load("res://texture/static/fullscreenfalse2.png")

func _on_fullscreen_mouse_exited():
	if fullscreen==true:
		$fullscreen.icon=load("res://texture/static/fullscrenntrue.png")
	else:
		$fullscreen.icon=load("res://texture/static/fullscreenfalse.png")



func _on_bonus_mouse_entered():
	$bonus.icon=load("res://texture/static/bonus2.png")


func _on_bonus_mouse_exited():
	$bonus.icon=load("res://texture/static/+.png")


func _on_malus_mouse_entered():
	$malus.icon=load("res://texture/static/malus2.png")


func _on_malus_mouse_exited():
	$malus.icon=load("res://texture/static/-.png")

func _on_control_mouse_entered():
	$control.icon=load("res://texture/static/keys2.png")


func _on_control_mouse_exited():
	$control.icon=load("res://texture/static/keys.png")


func _on_control_pressed():
	$start.visible=false
	$quit.visible=false
	$start2.visible=false
	$quit2.visible=false
	$_return.visible=true
	$return2.visible=true
	$_continue.visible=false
	$continue2.visible=false
	$begin.visible=false
	$begin2.visible=false
	$sound.visible=false
	$sound2.visible=false
	$bonus.visible=false
	$malus.visible=false
	$fullscreen.visible=false
	$fullscreen2.visible=false
	$control2/upbutton.visible=true
	$control2/up.visible=true
	$control2/leftbutton.visible=true
	$control2/left.visible=true
	$control2/rightbutton.visible=true
	$control2/right.visible=true
	$control2/firebutton.visible=true
	$control2/fire.visible=true
	$control2/downbutton.visible=true
	$control2/down.visible=true
	$control2/pausebutton.visible=true
	$control2/pause.visible=true
	$"control2/acceptbutton".visible=true
	$"control2/accept".visible=true
	$"control2/acceptbutton".text=InputMap.get_action_list("ok")[0].as_text()
	$control2/upbutton.text=InputMap.get_action_list("ui_up")[0].as_text()
	$control2/leftbutton.text=InputMap.get_action_list("ui_left")[0].as_text()
	$control2/rightbutton.text=InputMap.get_action_list("ui_right")[0].as_text()
	$control2/firebutton.text=InputMap.get_action_list("fire")[0].as_text()
	$control2/downbutton.text=InputMap.get_action_list("ui_down")[0].as_text()
	$control2/pausebutton.text=InputMap.get_action_list("pause")[0].as_text()

func _input(event):
	if event is InputEventKey:
		if up==true:
			var inputerase=InputMap.get_action_list("ui_up")[0]
			InputMap.action_erase_event("ui_up",inputerase)
			InputMap.action_add_event("ui_up",event)
			$control2/upbutton.text=InputMap.get_action_list("ui_up")[0].as_text()
			up=false
			$control2/blacktext.visible=false
			$control2/blacktext/text.visible=false
		if left==true:
			var inputerase=InputMap.get_action_list("ui_left")[0]
			InputMap.action_erase_event("ui_left",inputerase)
			InputMap.action_add_event("ui_left",event)
			$control2/leftbutton.text=InputMap.get_action_list("ui_left")[0].as_text()
			left=false
			$control2/blacktext.visible=false
			$control2/blacktext/text.visible=false
		if right==true:
			var inputerase=InputMap.get_action_list("ui_right")[0]
			InputMap.action_erase_event("ui_right",inputerase)
			InputMap.action_add_event("ui_right",event)
			$control2/rightbutton.text=InputMap.get_action_list("ui_right")[0].as_text()
			right=false
			$control2/blacktext.visible=false
			$control2/blacktext/text.visible=false
		if fire==true:
			var inputerase=InputMap.get_action_list("fire")[0]
			InputMap.action_erase_event("fire",inputerase)
			InputMap.action_add_event("fire",event)
			$control2/firebutton.text=InputMap.get_action_list("fire")[0].as_text()
			fire=false
			$control2/blacktext.visible=false
			$control2/blacktext/text.visible=false
		if down==true:
			var inputerase=InputMap.get_action_list("ui_down")[0]
			InputMap.action_erase_event("ui_down",inputerase)
			InputMap.action_add_event("ui_down",event)
			$control2/downbutton.text=InputMap.get_action_list("ui_down")[0].as_text()
			down=false
			$control2/blacktext.visible=false
			$control2/blacktext/text.visible=false
		if pause==true:
			var inputerase=InputMap.get_action_list("pause")[0]
			InputMap.action_erase_event("pause",inputerase)
			InputMap.action_add_event("pause",event)
			$control2/pausebutton.text=InputMap.get_action_list("pause")[0].as_text()
			pause=false
			$control2/blacktext.visible=false
			$control2/blacktext/text.visible=false
		if accept==true:
			var inputerase=InputMap.get_action_list("ok")[0]
			InputMap.action_erase_event("ok",inputerase)
			InputMap.action_add_event("ok",event)
			$control2/upbutton.text=InputMap.get_action_list("ok")[0].as_text()
			accept=false
			$control2/blacktext.visible=false
			$control2/blacktext/text.visible=false

func _on_upbutton_pressed():
	up=true
	left=false
	right=false
	fire=false
	down=false
	pause=false
	accept=false
	$control2/blacktext.visible=true
	$control2/blacktext/text.visible=true


func _on_leftbutton_pressed():
	up=false
	left=true
	right=false
	fire=false
	down=false
	pause=false
	accept=false
	$control2/blacktext.visible=true
	$control2/blacktext/text.visible=true


func _on_rightbutton_pressed():
	up=false
	left=false
	right=true
	fire=false
	down=false
	pause=false
	accept=false
	$control2/blacktext.visible=true
	$control2/blacktext/text.visible=true


func _on_firebutton_pressed():
	up=false
	left=false
	right=false
	fire=true
	down=false
	pause=false
	accept=false
	$control2/blacktext.visible=true
	$control2/blacktext/text.visible=true


func _on_downbutton_pressed():
	up=false
	left=false
	right=false
	fire=false
	down=true
	pause=false
	accept=false
	$control2/blacktext.visible=true
	$control2/blacktext/text.visible=true


func _on_pausebutton_pressed():
	up=false
	left=false
	right=false
	fire=false
	down=false
	pause=true
	accept=false
	$control2/blacktext.visible=true
	$control2/blacktext/text.visible=true


func _on_acceptbutton_pressed():
	up=false
	left=false
	right=false
	fire=false
	down=false
	pause=false
	accept=true
	$control2/blacktext.visible=true
	$control2/blacktext/text.visible=true
