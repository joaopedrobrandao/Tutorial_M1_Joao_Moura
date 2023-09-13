extends Sprite
var delay = false

func _ready():
	Global.municao = 0
	Global.recarregado = true
	Global.couldown = false
	delay = false

func _process(delta: float) -> void:
	
	if Global.character == 2:
		$"../../TempoEntreAK".wait_time = 0.05
	
	look_at(get_global_mouse_position())
	if Global.arma == 2:
		Global.projetil = preload("res://Scenes//Chumbo.tscn")
		if Input.is_action_pressed("atirar") and Global.criacao_no_pai != null and Global.recarregado and !Global.couldown and !delay:
			Global.instance_node(Global.projetil, global_position, Global.criacao_no_pai)
			$"../../AudioStreamPlayer2D".play()
			Global.municao += 1
			Global.couldown = true
			$"../../TempoEntreAK".start()
			if Global.municao == 40:
				Global.recarregado = false
	

func _on_TempoEntreAK_timeout():
	Global.couldown = false

