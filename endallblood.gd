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
	$cinema/trone.visible=true
	_wait(0.1)
	yield(self,"timer_end")
	$cinema/trone.visible=false
	_wait(0.1)
	yield(self,"timer_end")
	$cinema/trone.visible=true
	_wait(0.1)
	yield(self,"timer_end")
	$cinema/trone.visible=false
	_wait(0.1)
	yield(self,"timer_end")
	$cinema/trone.visible=true
	_wait(0.1)
	yield(self,"timer_end")
	$cinema/trone.visible=false
	_wait(0.1)
	yield(self,"timer_end")
	$cinema/trone.visible=true
	_wait(0.1)
	yield(self,"timer_end")
	$cinema/trone.visible=false
	_wait(0.1)
	yield(self,"timer_end")
	$cinema/trone.visible=true
	_wait(0.1)
	yield(self,"timer_end")
	$cinema/trone.visible=false
	_wait(0.1)
	yield(self,"timer_end")
	$cinema/trone.visible=true
	_wait(0.1)
	yield(self,"timer_end")
	$cinema/trone.visible=false
	_wait(0.1)
	yield(self,"timer_end")
	$cinema/trone.visible=true
	_wait(0.1)
	yield(self,"timer_end")
	$cinema/trone.visible=false
	_wait(0.1)
	yield(self,"timer_end")
	$cinema/trone.visible=true
	_wait(0.1)
	yield(self,"timer_end")
	$cinema/trone.visible=false
	_wait(0.1)
	yield(self,"timer_end")
	var succes = File.new()
	succes.open("res://SAVE/succes.tres", File.READ_WRITE)
	var linesucces= succes.get_as_text()
	succes.store_line(linesucces)
	succes.store_line("sallblood")
	succes.close()
	succes = File.new()
	succes.open("res://SAVE/save.tres", File.WRITE)
	succes.close()
	get_tree().change_scene("res://credit.tscn")

func _on_musique_finished():
	$sond/musique.play(1)