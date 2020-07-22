extends Node

signal pause
signal unpause
var oversound=false
var pause=false
signal timer_end
signal ok
var touch = false
var savepv = "savepv"
var pvextract=""
var file=File.new()
var end=false

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
	$sond/musique.play()
	$cinema/blacktext/indication.text=InputMap.get_action_list("ok")[0].as_text()+" pour passer"

func _on_musique_finished():
	$sond/musique.play()

func hit():
	$enemis.enemylife-=1
	$sond/hit.play()

func kill():
	$sond/enemykill.play()
	$enemis.enemylife-=1

func over():
	if oversound==false:
		$sond/gameover.play()
		oversound = true
		$playernode/player.finish=true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_node("restartmenu/quit").visible=true
		get_node("restartmenu/recommencer").visible=true
		get_node("restartmenu/quit2").visible=true
		get_node("restartmenu/home2").visible=true
		get_node("restartmenu/home").visible=true
		get_node("restartmenu/Button").visibility()

func _on_quit_mouse_entered():
	$restartmenu/quit.icon=load("res://texture/static/quit2.png")


func _on_quit_mouse_exited():
	$restartmenu/quit.icon=load("res://texture/static/quit.png")

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		if pause == false:
			pause=true
			emit_signal("pause")
			$restartmenu/unpause.visible=true
			$restartmenu/unpause2.visible=true
			$restartmenu/quitb.visible=true
			$restartmenu/quitb2.visible=true
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			pause=false
			emit_signal("unpause")
			$restartmenu/unpause.visible=false
			$restartmenu/unpause2.visible=false
			$restartmenu/quitb.visible=false
			$restartmenu/quitb2.visible=false
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	if Input.is_action_just_pressed("ok"):
		emit_signal("ok")
	if end==true:
		$sond/musique.pitch_scale=randi()%32

func _on_unpause_pressed():
	emit_signal("unpause")
	$restartmenu/unpause.visible=false
	$restartmenu/unpause2.visible=false
	$restartmenu/quitb.visible=false
	$restartmenu/quitb2.visible=false
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _on_quitb_pressed():
	get_tree().quit()

func end():
	if $playernode/player.finish==false:
		file.open("res://save/save.tres", File.WRITE)
		$cinema/LEETend.visible=true
		$cinema/LEETend/AnimationPlayer.play("leetend")
		end=true
		_wait(18)
		yield(self,"timer_end")
		var succes=File.new()
		succes.open("res://SAVE/succes.tres", File.READ_WRITE)
		var linesucces= succes.get_as_text()
		succes.store_line(linesucces)
		succes.get_line()
		succes.store_line("sleet")
		succes.close()
		get_tree().quit()

func touch():
	pass

func _on_Button_pressed():
	oversound = false
	$playernode/player.finish=false
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	get_node("restartmenu/quit").visible=false
	get_node("restartmenu/recommencer").visible=false
	get_node("restartmenu/quit2").visible=false
	get_node("restartmenu/home2").visible=false
	get_node("restartmenu/home").visible=false
	get_node("restartmenu/Button").visibility2()
