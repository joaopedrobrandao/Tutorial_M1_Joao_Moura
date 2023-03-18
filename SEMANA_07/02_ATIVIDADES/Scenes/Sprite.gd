extends Sprite
var projetil = preload("res://Scenes//Tiro.tscn")
var couldown = false
var delay = false


func _process(delta: float) -> void:
	look_at(get_global_mouse_position())

	if Input.is_action_just_pressed("atirar") and Global.criacao_no_pai != null and Global.recarregado and !couldown and !delay:
		Global.instance_node(projetil, global_position, Global.criacao_no_pai)
		$"../../AudioStreamPlayer2D".play()
		Global.municao += 1
		couldown = true
		$"../../tempoEntre".start()
		if Global.municao == 8:
			print("mun 6")
			Global.recarregado = false
			delay = true
			$"../../tempoRecarga".start()






func _on_tempoRecarga_timeout():
	delay = false


func _on_tempoEntre_timeout():
	couldown = false
	pass # Replace with function body.
