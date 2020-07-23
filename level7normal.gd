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
var lignee=""
var save = {
	
}

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
	$scorenode.begin=true
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
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		oversound = true
		$playernode/player.finish=true

func _on_quit_mouse_entered():
	$restartmenu/quit.icon=load("res://texture/static/quit2.png")


func _on_quit_mouse_exited():
	$restartmenu/quit.icon=load("res://texture/static/quit.png")

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		if oversound==false:
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
	$cinema/roi.visible=true
	$cinema/roi/AnimationPlayer.play("normal")
	$cinema/trone.visible=true
	$cinema/blacktext/text.text="LA FIN ARRIVE!\n TIEN BON!"
	$cinema/blacktext.visible=true
	yield(self,"ok")
	$cinema/blacktext/text.text=""
	$cinema/blacktext.visible=false
	_wait(2)
	yield(self,"timer_end")
	file.open("res://save/save.tres", File.READ)
	while not savepv== "":
		savepv=file.get_line()
		if  "0" in savepv  or "1" in savepv  or "2" in savepv  or "3" in savepv  or "4" in savepv  or "5" in savepv  or "6" in savepv  or "7" in savepv  or "8" in savepv or "9" in savepv:
			if not "res" in savepv:
				pvextract=savepv
		if "bad" in savepv:
			lignee="bad"
		elif "good" in savepv:
			lignee="good"
	file.close()
	if $mur/base.pv<5:
		var save_game = File.new()
		save_game.open("res://save/save.tres", File.WRITE)
		if not lignee=="":
			var save={
				"res://level8good"  :  "",
				pvextract+str($mur/base.pv)  :  "",
				lignee : ""
			}
		else:
			var save={
				"res://level8good.tscn"  :  "",
				pvextract+str($mur/base.pv)  :  ""
			}
		for i in save:
			save_game.store_line(i)
		save_game.close()
		get_tree().change_scene("res://level8good.tscn")
	else:
		var save_game = File.new()
		save_game.open("res://save/save.tres", File.WRITE)
		if not lignee=="":
			var save={
				"res://level8bad.tscn"  :  "",
				pvextract+str($mur/base.pv)  :  "",
				lignee : ""
			}
		else:
			var save={
				"res://level8bad.tscn"  :  "",
				pvextract+str($mur/base.pv)  :  ""
			}
		for i in save:
			save_game.store_line(i)
		save_game.close()
		get_tree().change_scene("res://level8bad.tscn")

func touch():
	pass