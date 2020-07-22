extends Node2D

func _on_AudioStreamPlayer_finished():
	$AudioStreamPlayer.play()





func _on_VisibilityEnabler2D_screen_entered():
	get_tree().change_scene("res://menu.tscn")
