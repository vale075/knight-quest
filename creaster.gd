extends Node

signal pause
signal unpause
var oversound=false
var pause=false
signal timer_end
signal ok
var touch = false
var pvcre=5
var sprite1=load("res://texture/knight quest/base.png")
var sprite2=load("res://texture/knight quest/E.png")
var sprite4=load("res://texture/knight quest/enemy.png")
var sprite5=load("res://texture/knight quest/fireball.png")
var sprite6=load("res://texture/knight quest/firecharge.png")
var sprite7=load("res://texture/knight quest/mur.png")
var sprite8=load("res://texture/knight quest/replay1.png")
var sprite9=load("res://texture/static/begin2.png")
var sprite10=load("res://texture/static/continue.png")
var sprite11=load("res://texture/static/fullscreenfalse.png")
var sprite12=load("res://texture/static/home.png")
var sprite3=load("res://texture/static/keys2.png")
var sprite0=load("res://texture/static/life.png")
var loade=load("res://Oof.tscn")
var begin = false
var enemyname=""
var die =7

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
	$cinema/roi/AnimationPlayer.play("normal")
	$sond/musique.play()
	$cinema/blacktext/indication.text=InputMap.get_action_list("ok")[0].as_text()+" pour passer"
	$cinema/blacktext.visible=true
	$cinema/blacktext/text.text="SALUT!!!!"
	yield(self,"ok")
	$cinema/blacktext/text.text=""
	$cinema/blacktext.visible=false
	_wait(2)
	yield(self,"timer_end")
	$cinema/blacktext.visible=true
	$cinema/blacktext/text.text="JE SUIS LE \n DIEUX DE CE \n MONDE"
	yield(self,"ok")
	$cinema/blacktext/text.text=""
	$cinema/blacktext.visible=false
	_wait(2)
	yield(self,"timer_end")
	$cinema/blacktext.visible=true
	$cinema/blacktext/text.text="TU AS EU \n DE LA CHANCE \n D'ARRIVER ICI"
	yield(self,"ok")
	$cinema/blacktext/text.text=""
	$cinema/blacktext.visible=false
	_wait(2)
	yield(self,"timer_end")
	$cinema/blacktext.visible=true
	$cinema/blacktext/text.text="A MOINS QUE \n TU TRICHE OU \n QUE QUELQU'UN \n T'AS DIT \n COMMENT FAIRE..."
	yield(self,"ok")
	$cinema/blacktext/text.text=""
	$cinema/blacktext.visible=false
	_wait(2)
	yield(self,"timer_end")
	$cinema/blacktext.visible=true
	$cinema/blacktext/text.text="DE TOUTE FACON \n CET ENDROIT EST \n LE MIEN, JE \n VAIS DEVOIR \n TE TUER"
	yield(self,"ok")
	$cinema/blacktext/text.text=""
	$cinema/blacktext.visible=false
	_wait(2)
	yield(self,"timer_end")
	$cinema/blacktext.visible=true
	$cinema/blacktext/text.text="AH OUI ET \n JE MAITRISE \n CE JEU, JE \n VAIS FAIRE \n EN SORTE"
	yield(self,"ok")
	$cinema/blacktext/text.text=""
	$cinema/blacktext.visible=false
	_wait(2)
	yield(self,"timer_end")
	$cinema/blacktext.visible=true
	$cinema/blacktext/text.text="QUE TU NE \n REVIENNE PLUS \n ICI!!!"
	yield(self,"ok")
	$cinema/blacktext/text.text=""
	$cinema/blacktext.visible=false
	_wait(2)
	yield(self,"timer_end")
	$sond/musique.stream=load("res://texture/knight quest/crefight.wav")
	$sond/musique.play()
	begin=true

func _on_musique_finished():
	$sond/musique.play()

func over():
	get_tree().quit()

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

func end():
	get_tree().quit()

func touch():
	pass

func _on_Area2D_area_entered(area):
	if "fireball" in area.name:
		pvcre-=1
		if pvcre<0:
			begin=false
			for n in get_children():
				if "Node2D" in n.name:
					remove_child(n)
					n.queue_free()
			die()

func _on_Timer_timeout():
	if begin==true:
		var sprite=randi()%13
		var enemy = loade.instance()
		enemy.position.x = rand_range(50,950)
		add_child(enemy)
		enemyname=enemy.name
		if sprite==0:
			get_node(str(enemyname,"/Area2D/Sprite")).texture=sprite0
		if sprite==1:
			get_node(str(enemyname,"/Area2D/Sprite")).texture=sprite1
		if sprite==2:
			get_node(str(enemyname,"/Area2D/Sprite")).texture=sprite2
		if sprite==3:
			get_node(str(enemyname,"/Area2D/Sprite")).texture=sprite3
		if sprite==4:
			get_node(str(enemyname,"/Area2D/Sprite")).texture=sprite4
		if sprite==5:
			get_node(str(enemyname,"/Area2D/Sprite")).texture=sprite5
		if sprite==6:
			get_node(str(enemyname,"/Area2D/Sprite")).texture=sprite6
		if sprite==7:
			get_node(str(enemyname,"/Area2D/Sprite")).texture=sprite7
		if sprite==8:
			get_node(str(enemyname,"/Area2D/Sprite")).texture=sprite8
		if sprite==9:
			get_node(str(enemyname,"/Area2D/Sprite")).texture=sprite9
		if sprite==10:
			get_node(str(enemyname,"/Area2D/Sprite")).texture=sprite10
		if sprite==11:
			get_node(str(enemyname,"/Area2D/Sprite")).texture=sprite11
		if sprite==12:
			get_node(str(enemyname,"/Area2D/Sprite")).texture=sprite12

func die():
	die-=1
	if die ==6:
		$cinema/blacktext.visible=true
		$cinema/blacktext/text.text="TU EST FORT \n MAIS JE N'AI \n PAS PREVU \n DE MOURRIR"
		yield(self,"ok")
		$cinema/blacktext/text.text=""
		$cinema/blacktext.visible=false
		_wait(2)
		begin=true
	if die ==5:
		$cinema/blacktext.visible=true
		$cinema/blacktext/text.text="TU NE COMPRENDS \n RIEN HEIN, TU \n RENCOTRE CELUI \n QUI AS TOUTE \n LES PERMISSIONS..."
		yield(self,"ok")
		$cinema/blacktext/text.text=""
		$cinema/blacktext.visible=false
		_wait(2)
		begin=true
	if die ==4:
		$cinema/blacktext.visible=true
		$cinema/blacktext/text.text="CETTE MUSIQUE EST \n ENNUYANTE... MAIS \n BON ESTIME TOI \n HEUREUX D'ETRE \n EN VIE"
		yield(self,"ok")
		$cinema/blacktext/text.text=""
		$cinema/blacktext.visible=false
		_wait(2)
		begin=true
	if die ==3:
		$cinema/blacktext.visible=true
		$cinema/blacktext/text.text="TU COMMENCE \n A M'ENERVER!"
		yield(self,"ok")
		$cinema/blacktext/text.text=""
		$cinema/blacktext.visible=false
		_wait(2)
		begin=true
	if die ==2:
		$cinema/blacktext.visible=true
		$cinema/blacktext/text.text="ABANDONNE! SI TU \n VEUT RETROUVER \n TA VIE NORMALE \n CE N'EST PAS \n LA BONNE FIN!"
		yield(self,"ok")
		$cinema/blacktext/text.text=""
		$cinema/blacktext.visible=false
		_wait(2)
		begin=true
	if die ==1:
		$cinema/blacktext.visible=true
		$cinema/blacktext/text.text="RIEN NE T'ARRETE? \n BON UNE DERNIERE \n VAGUE ET JE \n CROIS QUE TU \n MERITERAS UN \n BADGE"
		yield(self,"ok")
		$cinema/blacktext/text.text=""
		$cinema/blacktext.visible=false
		_wait(2)
		begin=true
	if die ==0:
		$cinema/blacktext.visible=true
		$cinema/blacktext/text.text="TU EST VRAIMENT \n FORT! TU PEUT \n ETRE FIER \n DE TOI"
		yield(self,"ok")
		$cinema/blacktext/text.text=""
		$cinema/blacktext.visible=false
		_wait(2)
		var succes=File.new()
		succes.open("res://SAVE/succes.tres", File.READ_WRITE)
		succes.store_line("scre")
		succes.close()
		get_tree().quit()