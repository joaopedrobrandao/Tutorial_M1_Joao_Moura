extends Node2D

func _ready():
	$Timer.start()
	Global.pontuacao = 0

func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes/Menu.tscn")
