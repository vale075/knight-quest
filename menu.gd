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
var line = "line"
var LEVEL = ""
signal timer_end
var erase = 1


func _wait( seconds ):
	self._create_timer(self, seconds, true, "_emit_timer_end_signal")

func _emit_timer_end_signal():
	emit_signal("timer_end")

func _create_timer(object_target, float_wait_time, bool_is_oneshot, string_function):
	var timer = Timer.new()
	timer.set_one_shot(bool_is_oneshot)
	timer.set_timer_process_mode(0)
	timer.set_wait_time(float_wait_time)
	timer.connect("timeout", object_target, string_function)
	self.add_child(timer)
	timer.start()

func _ready():
	$menumusic.play()
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -20+(2*7))
	var file = File.new()
	file.open("res://SAVE/inputsave.tres",File.READ)
	if file.get_as_text():
		var event=InputEventKey.new()
		event.set_scancode(int(file.get_line()))
		var inputerase=InputMap.get_action_list("ui_up")[0]
		InputMap.action_erase_event("ui_up",inputerase)
		InputMap.action_add_event("ui_up",event)
		event=InputEventKey.new()
		event.set_scancode(int(file.get_line()))
		inputerase=InputMap.get_action_list("ui_left")[0]
		InputMap.action_erase_event("ui_left",inputerase)
		InputMap.action_add_event("ui_left",event)
		event=InputEventKey.new()
		event.set_scancode(int(file.get_line()))
		inputerase=InputMap.get_action_list("ui_right")[0]
		InputMap.action_erase_event("ui_right",inputerase)
		InputMap.action_add_event("ui_right",event)
		event=InputEventKey.new()
		event.set_scancode(int(file.get_line()))
		inputerase=InputMap.get_action_list("fire")[0]
		InputMap.action_erase_event("fire",inputerase)
		InputMap.action_add_event("fire",event)
		event=InputEventKey.new()
		event.set_scancode(int(file.get_line()))
		inputerase=InputMap.get_action_list("ui_down")[0]
		InputMap.action_erase_event("ui_down",inputerase)
		InputMap.action_add_event("ui_down",event)
		event=InputEventKey.new()
		event.set_scancode(int(file.get_line()))
		inputerase=InputMap.get_action_list("pause")[0]
		InputMap.action_erase_event("pause",inputerase)
		InputMap.action_add_event("pause",event)
		event=InputEventKey.new()
		event.set_scancode(int(file.get_line()))
		inputerase=InputMap.get_action_list("ok")[0]
		InputMap.action_erase_event("ok",inputerase)
		InputMap.action_add_event("ok",event)
	file.close()

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
	$succes2/allbloodsucces.visible=false
	$succes2/elfteamsucces.visible=false
	$succes2/peacesucces.visible=false
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
	$succes2/timebadsucces.visible=false
	$succes2/elfbloodsucces.visible=false
	$succes2/timegoodsucces.visible=false
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
	$succes2/badelfsucces.visible=false
	$"control2/acceptbutton".visible=false
	$"control2/accept".visible=false
	$succes2/cresucces.visible=false
	$succes2/leetsucces.visible=false
	$succes2/endwarssucces.visible=false
	$succes2/badkingsucces.visible=false
	$succes2/kingbloodsucces.visible=false
	$succes2/kingteamsucces.visible=false
	$succes2/toostrongsucces.visible=false
	$succes2/allenemysucces.visible=false

func _on__continue_mouse_entered():
	$_continue.icon=load("res://texture/static/continue2.png")


func _on__continue_mouse_exited():
	$_continue.icon=load("res://texture/static/continue.png")


func _on__continue_pressed():
	var save_game= File.new()
	save_game.open("res://save/save.tres", File.READ)
	if save_game.get_line()== "":
		$control2/blacktext.visible=true
		$control2/blacktext/text.text="AUCUNE \nSAUVEGARDE \n DETECTE"
		_wait(2)
		yield(self,"timer_end")
		$control2/blacktext.visible=false
		$control2/blacktext/text.text="APUYEZ \n SUR UNE \n TOUCHE"
	save_game= File.new()
	save_game.open("res://save/save.tres", File.READ)
	if not save_game.get_line()== "":
		save_game= File.new()
		save_game.open("res://save/save.tres", File.READ)
		while not line == "":
			line = save_game.get_line()
			if "res" in line:
				LEVEL = line
		save_game.close()
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		get_tree().change_scene(LEVEL)


func _on_begin_mouse_entered():
	$begin.icon=load("res://texture/static/begin2.png")


func _on_begin_mouse_exited():
	$begin.icon=load("res://texture/static/begin.png")


func _on_begin_pressed():
	if erase == 0:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		var save_game = File.new()
		save_game.open("res://save/save.tres", File.WRITE)
		get_tree().change_scene("res://tutoriel.tscn")
	var save_game= File.new()
	save_game.open("res://save/save.tres", File.READ)
	if not save_game.get_line()== "":
		$control2/blacktext.visible=true
		$control2/blacktext/text.rect_scale.x=0.3
		$control2/blacktext/text.rect_scale.y=0.3
		$control2/blacktext/text.text="ATTENTION ! COMMENCER \n UNE PARTIE SUPRIMERAS \n VOTRE ANCIENE \nSAUVEGARDE"
		_wait(2)
		yield(self,"timer_end")
		$control2/blacktext/text.rect_scale.x=0.6
		$control2/blacktext/text.rect_scale.y=0.6
		$control2/blacktext.visible=false
		$control2/blacktext/text.text="APUYEZ \n SUR UNE \n TOUCHE"
		save_game.close()
		erase-=1
	else:
		save_game.close()
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		save_game = File.new()
		save_game.open("res://save/save.tres", File.WRITE)
		get_tree().change_scene("res://tutoriel.tscn")
	

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
	$succes2/elfteamsucces.visible=false
	$succes2/peacesucces.visible=false
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
	$succes2/timegoodsucces.visible=false
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
	$succes2/cresucces.visible=false
	$succes2/leetsucces.visible=false
	$succes2/endwarssucces.visible=false
	$succes2/badkingsucces.visible=false
	$succes2/kingbloodsucces.visible=false
	$succes2/allbloodsucces.visible=false
	$succes2/timebadsucces.visible=false
	$succes2/elfbloodsucces.visible=false
	$succes2/badelfsucces.visible=false
	$succes2/kingteamsucces.visible=false
	$succes2/toostrongsucces.visible=false
	$succes2/allenemysucces.visible=false
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
	$succes2/cresucces.visible=false
	$succes2/leetsucces.visible=false
	$succes2/elfteamsucces.visible=false
	$succes2/peacesucces.visible=false
	$succes2/endwarssucces.visible=false
	$succes2/badkingsucces.visible=false
	$succes2/kingbloodsucces.visible=false
	$succes2/allbloodsucces.visible=false
	$succes2/timegoodsucces.visible=false
	$succes2/timebadsucces.visible=false
	$succes2/elfbloodsucces.visible=false
	$succes2/badelfsucces.visible=false
	$succes2/kingteamsucces.visible=false
	$succes2/toostrongsucces.visible=false
	$succes2/allenemysucces.visible=false
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
			saveinput()
		if left==true:
			var inputerase=InputMap.get_action_list("ui_left")[0]
			InputMap.action_erase_event("ui_left",inputerase)
			InputMap.action_add_event("ui_left",event)
			$control2/leftbutton.text=InputMap.get_action_list("ui_left")[0].as_text()
			left=false
			$control2/blacktext.visible=false
			$control2/blacktext/text.visible=false
			saveinput()
		if right==true:
			var inputerase=InputMap.get_action_list("ui_right")[0]
			InputMap.action_erase_event("ui_right",inputerase)
			InputMap.action_add_event("ui_right",event)
			$control2/rightbutton.text=InputMap.get_action_list("ui_right")[0].as_text()
			right=false
			$control2/blacktext.visible=false
			$control2/blacktext/text.visible=false
			saveinput()
		if fire==true:
			var inputerase=InputMap.get_action_list("fire")[0]
			InputMap.action_erase_event("fire",inputerase)
			InputMap.action_add_event("fire",event)
			$control2/firebutton.text=InputMap.get_action_list("fire")[0].as_text()
			fire=false
			$control2/blacktext.visible=false
			$control2/blacktext/text.visible=false
			saveinput()
		if down==true:
			var inputerase=InputMap.get_action_list("ui_down")[0]
			InputMap.action_erase_event("ui_down",inputerase)
			InputMap.action_add_event("ui_down",event)
			$control2/downbutton.text=InputMap.get_action_list("ui_down")[0].as_text()
			down=false
			$control2/blacktext.visible=false
			$control2/blacktext/text.visible=false
			saveinput()
		if pause==true:
			var inputerase=InputMap.get_action_list("pause")[0]
			InputMap.action_erase_event("pause",inputerase)
			InputMap.action_add_event("pause",event)
			$control2/pausebutton.text=InputMap.get_action_list("pause")[0].as_text()
			pause=false
			$control2/blacktext.visible=false
			$control2/blacktext/text.visible=false
			saveinput()
		if accept==true:
			var inputerase=InputMap.get_action_list("ok")[0]
			InputMap.action_erase_event("ok",inputerase)
			InputMap.action_add_event("ok",event)
			$control2/acceptbutton.text=InputMap.get_action_list("ok")[0].as_text()
			accept=false
			$control2/blacktext.visible=false
			$control2/blacktext/text.visible=false
			saveinput()

func saveinput():
	var inputsave= File.new()
	inputsave.open("res://SAVE/inputsave.tres",File.WRITE)
	inputsave.store_line(str((InputMap.get_action_list("ui_up")[0].scancode)))
	inputsave.store_line(str((InputMap.get_action_list("ui_left")[0].scancode)))
	inputsave.store_line(str((InputMap.get_action_list("ui_right")[0].scancode)))
	inputsave.store_line(str((InputMap.get_action_list("fire")[0].scancode)))
	inputsave.store_line(str((InputMap.get_action_list("ui_down")[0].scancode)))
	inputsave.store_line(str((InputMap.get_action_list("pause")[0].scancode)))
	inputsave.store_line(str((InputMap.get_action_list("ok")[0].scancode)))

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


func _on_succes_mouse_entered():
	$succes.icon=load("res://texture/knight quest/coupe1.png")


func _on_succes_mouse_exited():
	$succes.icon=load("res://texture/knight quest/coupe0.png")


func _on_succes_pressed():
	$start.visible=false
	$quit.visible=false
	$start2.visible=false
	$quit2.visible=false
	$_return.visible=false
	$return2.visible=false
	$_continue.visible=false
	$continue2.visible=false
	$begin.visible=false
	$begin2.visible=false
	$succes2/cresucces.visible=true
	$succes2/leetsucces.visible=true
	$succes2/elfteamsucces.visible=true
	$succes2/peacesucces.visible=true
	$_return.visible=true
	$return2.visible=true
	$succes2/endwarssucces.visible=true
	$succes2/badkingsucces.visible=true
	$succes2/kingbloodsucces.visible=true
	$succes2/allbloodsucces.visible=true
	$succes2/timegoodsucces.visible=true
	$succes2/timebadsucces.visible=true
	$succes2/elfbloodsucces.visible=true
	$succes2/badelfsucces.visible=true
	$succes2/kingteamsucces.visible=true
	$succes2/toostrongsucces.visible=true
	$succes2/allenemysucces.visible=true
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
	$control2/accept.visible=false
	$control2/acceptbutton.visible=false
	$sound.visible=false
	$sound2.visible=false
	$bonus.visible=false
	$malus.visible=false
	$fullscreen.visible=false
	$fullscreen2.visible=false
	var succes=File.new()
	succes.open("res://SAVE/succes.tres", File.READ)
	var linesucces = "line"
	while not linesucces== "":
		linesucces=succes.get_line()
		if  "scre" in linesucces:
			$succes2/cresucces.texture=load("res://texture/knight quest/scre.png")
		if "sleet" in linesucces:
			$succes2/leetsucces.texture=load("res://texture/knight quest/sleet.png")
		if "selfteam" in linesucces:
			$succes2/elfteamsucces.texture=load("res://texture/knight quest/selfteam.png")
		if "speace" in linesucces:
			$succes2/peacesucces.texture=load("res://texture/knight quest/speace.png")
		if "sendwars" in linesucces:
			$succes2/endwarssucces.texture=load("res://texture/knight quest/sendwars.png")
		if "sbadking" in linesucces:
			$succes2/endwarssucces.texture=load("res://texture/knight quest/sbadking.png")
		if "skingblood" in linesucces:
			$succes2/kingbloodsucces.texture=load("res://texture/knight quest/kingblood.png")
		if "sallblood" in linesucces:
			$succes2/allbloodsucces.texture=load("res://texture/knight quest/kingblood.png")
		if "stimegood" in linesucces:
			$succes2/timegoodsucces.texture=load("res://texture/knight quest/timegood.png")
		if "stimebad" in linesucces:
			$succes2/timebadsucces.texture=load("res://texture/knight quest/timebad.png")
		if "stimebad" in linesucces:
			$succes2/elfbloodsucces.texture=load("res://texture/knight quest/selfblood.png")
		if "sbadelf" in linesucces:
			$succes2/badelfsucces.texture=load("res://texture/knight quest/sbadelf.png")
		if "skingteam" in linesucces:
			$succes2/kingteamsucces.texture=load("res://texture/knight quest/sendkingteam.png")
		if "stoostrong" in linesucces:
			$succes2/toostrongsucces.texture=load("res://texture/knight quest/stoostrong.png")
		if "sallenemy" in linesucces:
			$succes2/allenemysucces.texture=load("res://texture/knight quest/sallenemy.png")
	succes.close()
