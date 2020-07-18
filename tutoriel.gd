extends Node

signal pause
signal unpause
var oversound=false
var pause=false
signal timer_end
var cine=0
var fight=false
var okok=false
var another=false
var speed = float(18)
var musique = true
var easter= false

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
	_wait(2)
	yield(self,"timer_end")
	$"cinématiques/textback".visible=true
	$"cinématiques/textback/text".text = "SALUT"
	$"cinématiques/textback/indication".text=InputMap.get_action_list("ok")[0].as_text()+" pour passer"

func cinema():
	if cine==0:
		cine+=1
		$"cinématiques/textback".visible=true
		$"cinématiques/textback/text".text = "JE ME PRÉSENTE: JE \n SUIS MART II, LE \n GRAND ROI \n DU MARTLAND"
	elif cine==1:
		cine+=1
		$"cinématiques/textback".visible=true
		$"cinématiques/textback/text".text = "NOUS COURONS UN GRAND DANGER... \n, LES DIFFÉRENTES \n RACES DE CE MONDE \n CE SONT LIGUÉES \n CONTRE NOUS..."
	elif cine==2:
		cine+=1
		$"cinématiques/textback".visible=true
		$"cinématiques/textback/text".text = "NOUS DEVONS LES \n ARRÊTER \n POUR LE ROYAUME!"
	elif cine==3:
		cine+=1
		$"cinématiques/textback".visible=true
		$"cinématiques/textback/text".text = "MAIS POUR CELA \n J'AI BESOIN DE TOI"
	elif cine==4:
		cine+=1
		$"cinématiques/textback".visible=true
		$"cinématiques/textback/text".text = "JE VAIS TE FAIRE \n DEVENIR UN GRAND \n CHEVALIER"
	elif cine==5:
		cine+=1
		$"cinématiques/salletrone".visible=false
		$playernode/player.position=Vector2(504.205,351.11)
		$"cinématiques/roi".position=Vector2(902.25,233.542)
		okok=true
		_wait(2)
		yield(self,"timer_end")
		okok=false
		cinema()
	elif cine==6:
		cine+=1
		$"cinématiques/textback".visible=true
		$"cinématiques/textback/text".text = "TE VOICI DEVANT LES \n PORTES DU CHATEAU"
	elif cine==7:
		cine+=1
		$"cinématiques/textback".visible=true
		$"cinématiques/textback/text".text = "LE SCORE, C'EST LE \n NOMBRE DE PERSONNES \n DU ROYAUME QUE \n TU AS SAUVE"
	elif cine==8:
		cine+=1
		$"cinématiques/textback".visible=true
		$"cinématiques/textback/text".text = "LE COMBO, C'EST LE \n NOMBRE D'ENNEMI QUE \n TU AS TUÉ A LA SUITE \n SANS QUE LE ROYAUME \n AI SUBIS DE DEGATS"
	elif cine==9:
		cine+=1
		$"cinématiques/textback".visible=true
		$"cinématiques/textback/text".text = "POUR TE DÉPLACER \n UTILISE LES FLÈCHES"
	elif cine==10:
		cine+=1
		$"cinématiques/textback".visible=true
		$"cinématiques/textback/text".text = "SI TU SOUHAITE \n FAIRE UNE PAUSE \n APPUIE SUR "+InputMap.get_action_list("pause")[0].as_text()
	elif cine==11:
		cine+=1
		$"cinématiques/textback".visible=true
		$"cinématiques/textback/text".text = "JE CROIS QU'UN \n ENNEMIS ARRIVE. \n CHARGE!!!"
	elif cine==12:
		fight = true
		cine+=1
		var enemytu=load("res://enemytu.tscn").instance()
		enemytu.speed=speed
		enemytu.position.x = rand_range(50,950)
		add_child(enemytu)
		$scorenode.begin=true
	elif cine==13:
		cine+=1
		speed=1
		$"cinématiques/textback".visible=true
		$"cinématiques/textback/text".text = "FELICITATION!"
		fight=false
	elif cine==14:
		cine+=1
		$"cinématiques/textback".visible=true
		$"cinématiques/textback/text".text = "JE VAIS TE DONNER \n UN TRUC..."
	elif cine==15:
		cine+=1
		$"cinématiques/textback".visible=true
		$"cinématiques/textback/text".text = "UNE AME DE FEU!"
	elif cine==16:
		musique=false
		$sond/musique.stop()
		cine+=1
		fight=true
		$"cinématiques/amedefeu".visible=true
		$"cinématiques/amedefeu/AnimationPlayer".play("accaparement")
		$"sond/ame de feu".play()
		_wait(7.8)
		yield(self,"timer_end")
		$"cinématiques/amedefeu".visible=false
		_wait(2)
		yield(self,"timer_end")
		fight=false
		$sond/musique.play()
		musique=true
		$playernode.fireactive=true
		$firerecharge.visible=true
		$"cinématiques/textback".visible=true
		$"cinématiques/textback/text".text = "TU PEUT MAINTENANT \n TIRER DES LIGNÉES \n DE FEU EN APPUYANT \n SUR "+InputMap.get_action_list("fire")[0].as_text()
	elif cine==17:
		cine+=1
		$"cinématiques/textback".visible=true
		$"cinématiques/textback/text".text = "TU PEUT AUSSI VOIR \n EN BAS A GAUCHE \n UNE JAUGE DE CHARGE \n DE TA LIGNÉE DE FEU"
	elif cine==18:
		cine+=1
		$"cinématiques/textback".visible=true
		$"cinématiques/textback/text".text = "JE CROIS QU'UN \n AUTRE ENNEMIS ARRIVE. \n TIRE!!!"
	elif cine==19:
		fight = true
		cine+=1
		var enemytu=load("res://enemytu.tscn").instance()
		enemytu.speed=speed
		enemytu.position.x = rand_range(50,950)
		add_child(enemytu)
		$scorenode.begin=true
	elif cine==20:
		cine+=1
		$"cinématiques/textback".visible=true
		$"cinématiques/textback/text".text = "BIEN JOUÉ! \n TU ES PRET \n MAINTENANT"
	elif cine==21:
		get_tree().change_scene("res://level1.tscn")
	elif cine==666:
		musique=false
		easter=true
		$sond/musique.stop()
		$"cinématiques/textback".visible=true
		$"cinématiques/tutoeaster".visible=true
		$"cinématiques/textback/text".visible=false
		$"cinématiques/textback/indication".visible=false
		$"cinématiques/tutoeaster/AnimationPlayer".play("easter")
		_wait(3)
		yield(self,"timer_end")
		$sond/easteregg.play()
		_wait(1)
		yield(self,"timer_end")
		get_tree().quit()

func _on_musique_finished():
	if musique == true:
		$sond/musique.play()

func hit():
	$sond/hit.play()

func kill():
	$sond/enemykill.play()

func over():
	fight=false
	$"cinématiques/textback".visible=true
	$"cinématiques/textback/text".text ="TU EST NUL!"
	cine=666

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
		if easter==false:
			if fight == false:
				if okok == false:
					okok=true
					$"cinématiques/textback".visible=false
					_wait(1)
					yield(self,"timer_end")
					cinema()
					okok=false
			if another==true:
				if easter==false:
					$"cinématiques/textback".visible=false
				another=false
				var enemytu=load("res://enemytu.tscn").instance()
				speed=float(speed/1.3)
				enemytu.speed=speed
				enemytu.position.x = rand_range(50,950)
				add_child(enemytu)

func _on_unpause_pressed():
	emit_signal("unpause")
	$restartmenu/unpause.visible=false
	$restartmenu/unpause2.visible=false
	$restartmenu/quitb.visible=false
	$restartmenu/quitb2.visible=false
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _on_quitb_pressed():
	get_tree().quit()

func killtu():
	fight=false
	cinema()

func damagetu():
	another=true
	$"cinématiques/textback".visible=true
	$"cinématiques/textback/text".text = "Fait attention..."
