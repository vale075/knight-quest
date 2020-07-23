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
	$cinema/roi/AnimationPlayer.play("normal")
	$cinema/blacktext/indication.text=InputMap.get_action_list("ok")[0].as_text()+" pour passer"
	$cinema/blacktext/text.text="VOUS AVEZ CHOISIS \nLE SANG ET \n VOUS L'AUREZ"
	$cinema/blacktext.visible=true
	yield(self,"ok")
	$cinema/blacktext/text.text=""
	$cinema/blacktext.visible=false
	_wait(2)
	yield(self,"timer_end")
	$cinema/blacktext/text.text="VOUS ALLEZ \n DEVOIR PAYER"
	$cinema/blacktext.visible=true
	yield(self,"ok")
	$cinema/blacktext/text.text=""
	$cinema/blacktext.visible=false
	_wait(2)
	yield(self,"timer_end")
	$cinema/roi.visible=false
	$cinema/Node2D.visible=true
	$cinema/Node2D.go()
	$cinema/king.visible=true

func _on_musique_finished():
	$sond/musique.play()

func over():
	if oversound==false:
		$sond/gameover.play()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		oversound = true
		$playernode/player.finish=true
		$restartmenu/Button.visible=true
		$restartmenu/quit.visible=true
		$restartmenu/recommencer.visible=true
		$restartmenu/quit2.visible=true
		$restartmenu/home.visible=true
		$restartmenu/home2.visible=true

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
	$cinema/Node2D.visible=false
	$cinema/blacktext/text.text="J'AURAIS FAIT\n  CE QUE JE \n POUVAIS"
	$cinema/blacktext.visible=true
	for i in $cinema.get_children():
		if "Area2D" in i.name:
			i.queue_free()
	yield(self,"ok")
	$cinema/blacktext/text.text=""
	$cinema/blacktext.visible=false
	_wait(2)
	yield(self,"timer_end")
	$"cinema/roi mort".visible=true
	$"cinema/roi mort/AnimationPlayer".play("dath")
	_wait(5)
	yield(self,"timer_end")
	var succes = File.new()
	succes.open("res://SAVE/succes.tres", File.READ_WRITE)
	var linesucces= succes.get_as_text()
	succes.store_line(linesucces)
	succes.store_line("skingteam")
	succes.close()
	succes = File.new()
	succes.open("res://SAVE/save.tres", File.WRITE)
	succes.close()
	get_tree().change_scene("res://credit.tscn")

func touch():
	pass

func _on_Button_pressed():
	$playernode/player.finish=false
	$restartmenu/Button.visible=false
	$restartmenu/quit.visible=false
	$restartmenu/recommencer.visible=false
	$restartmenu/quit2.visible=false
	$restartmenu/home.visible=false
	$restartmenu/home2.visible=false
	oversound=false
	for i in $cinema.get_children():
		if "Area" in i.name:
			i.queue_free()