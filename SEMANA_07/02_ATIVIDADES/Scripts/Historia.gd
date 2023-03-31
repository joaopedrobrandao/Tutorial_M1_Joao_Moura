extends Node2D


func _on_Play_pressed():
	Global.arma = 0
	get_tree().change_scene("res://Scenes/Instruction.tscn")


func _on_Play2_pressed():
	Global.arma = 1
	get_tree().change_scene("res://Scenes/Instruction.tscn")


func _on_TextureButton_pressed():
	Global.arma = 2
	get_tree().change_scene("res://Scenes/Instruction.tscn")
