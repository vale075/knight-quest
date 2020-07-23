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

func _process(delta):
	if Input.is_action_just_pressed("ok"):
		emit_signal("ok")

func _ready():
	$cinema/roi/AnimationPlayer.play("normal")
	$cinema/blacktext/indication.text=InputMap.get_action_list("ok")[0].as_text()+" pour passer"
	$cinema/blacktext/text.text="LA GUERRE EST \n FINIT"
	$cinema/blacktext.visible=true
	yield(self,"ok")
	$cinema/blacktext/text.text=""
	$cinema/blacktext.visible=false
	_wait(2)
	yield(self,"timer_end")
	$cinema/blacktext/text.text="TON AIDE AS \n éTé PRéCIEUSE ET \n SANS DOUTE QU'ELLE \n NOUS AS SAUVé"
	$cinema/blacktext.visible=true
	yield(self,"ok")
	$cinema/blacktext/text.text=""
	$cinema/blacktext.visible=false
	_wait(2)
	yield(self,"timer_end")
	$cinema/blacktext/text.text="MAIS TU AS \nTUé BEAUCOUP DE \nMES HOMMES... TU\n DOIT ETRE JUGé \nPOUR TES CRIMES"
	$cinema/blacktext.visible=true
	yield(self,"ok")
	$cinema/blacktext/text.text=""
	$cinema/blacktext.visible=false
	_wait(2)
	yield(self,"timer_end")
	$cinema/blacktext/text.text="TU DOIT PAYER \nDE TA VIE"
	$cinema/blacktext.visible=true
	yield(self,"ok")
	$cinema/blacktext/text.text=""
	$cinema/blacktext.visible=false
	_wait(2)
	yield(self,"timer_end")
	var succes = File.new()
	succes.open("res://SAVE/succes.tres", File.READ_WRITE)
	var linesucces= succes.get_as_text()
	succes.store_line(linesucces)
	succes.store_line("sendwars")
	succes.close()
	succes = File.new()
	succes.open("res://SAVE/save.tres", File.WRITE)
	succes.close()
	get_tree().quit()

func _on_musique_finished():
	$sond/musique.play(0)
