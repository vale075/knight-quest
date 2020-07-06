extends Node

signal pause
signal unpause
var oversound=false
var pause=false
signal timer_end
signal ok
var touch = false

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
	$playernode/player.position=Vector2(517.205,521.11)
	$cinema/blacktext.visible=true
	$cinema/blacktext/text.text="HEY!"
	$cinema/roi/AnimationPlayer.play("normal")
	yield(self,"ok")
	$cinema/blacktext/text.text=""
	$cinema/blacktext/indication.visible=false
	_wait(2)
	yield(self,"timer_end")
	$cinema/blacktext/text.text="JE SUIS FELICIA \n LA REINE ELFE"
	$cinema/blacktext/indication.visible=true
	yield(self,"ok")
	$cinema/blacktext/text.text=""
	$cinema/blacktext/indication.visible=false
	_wait(2)
	yield(self,"timer_end")
	$cinema/blacktext/text.text="NOUS, LES AUTRES \n RACES \n AVONS BESOIN DE TOI"
	$cinema/blacktext/indication.visible=true
	yield(self,"ok")
	$cinema/blacktext/text.text=""
	$cinema/blacktext/indication.visible=false
	_wait(2)
	yield(self,"timer_end")
	$cinema/blacktext/text.text="LE ROI NOUS \n MASSACRE DEPUIS \n TROP LONGTEMPS"
	$cinema/blacktext/indication.visible=true
	yield(self,"ok")
	$cinema/blacktext/text.text=""
	$cinema/blacktext/indication.visible=false
	_wait(2)
	yield(self,"timer_end")
	$cinema/blacktext/text.text="AIDE NOUS A \n LE FAIRE TOMBER \n S'IL TE PLAIT"
	$cinema/blacktext/indication.visible=true
	yield(self,"ok")
	$cinema/blacktext/text.text=""
	$cinema/blacktext/indication.visible=false
	_wait(2)
	yield(self,"timer_end")
	$cinema/blacktext/text.text="POUR CA C'EST \n SIMPLE : FAIT EN SORTE \n QU'UN MAXIMUM DE \n NOS SOLDAT PASSE"
	$cinema/blacktext/indication.visible=true
	yield(self,"ok")
	$cinema/blacktext/text.text=""
	$cinema/blacktext/indication.visible=false
	_wait(2)
	yield(self,"timer_end")
	$cinema/blacktext/text.text="FAIT JUSTE ATENTON \n QU'IL N'Y EN \n AS PAS TROP QUI \n PASSE... SINON LE ROI \n VA S'EN RENDRE COMPTE"
	$cinema/blacktext/indication.visible=true
	yield(self,"ok")
	$cinema/blacktext/text.text=""
	$cinema/blacktext/indication.visible=false
	_wait(2)
	yield(self,"timer_end")
	$cinema/blacktext/text.text="ON COMPTE SUR \n TOI"
	$cinema/blacktext/indication.visible=true
	yield(self,"ok")
	$cinema/blacktext/text.text=""
	$cinema/blacktext/indication.visible=false
	_wait(2)
	yield(self,"timer_end")
	if $mur/base.pv<5:
		pass
	else:
		pass

func touch():
	pass
