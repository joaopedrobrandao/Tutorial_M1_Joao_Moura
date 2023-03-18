extends Node2D


func _ready():
	pass # Replace with function body.

func _on_Play_pressed():
	get_tree().change_scene("res://Scenes/Historia.tscn")

func _on_Credits_pressed():
	get_tree().change_scene("res://Scenes/Credits.tscn")
