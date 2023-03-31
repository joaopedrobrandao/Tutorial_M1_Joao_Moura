extends Sprite
var delay = false

func _ready():
	Global.municao = 0
	Global.recarregado = true
	Global.couldown = false
	delay = false

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	if Global.arma == 1:
		Global.projetil = preload("res://Scenes//Muni.tscn")
		if Input.is_action_just_pressed("atirar") and Global.criacao_no_pai != null and Global.recarregado and !Global.couldown and !delay:
			Global.instance_node(Global.projetil, global_position, Global.criacao_no_pai)
			$"../../AudioStreamPlayer2D".play()
			Global.municao += 1
			Global.couldown = true
			$"../../tempoEntre".start()
			if Global.municao == 6:
				Global.recarregado = false


func _on_tempoEntre_timeout():
	Global.couldown = false
