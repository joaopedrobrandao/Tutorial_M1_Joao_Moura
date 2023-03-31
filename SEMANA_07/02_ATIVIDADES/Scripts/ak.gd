extends Sprite

var capsula = preload("res://Scenes/Capsula.tscn")
var projetil = preload("res://Scenes/ProjetilMagnum.tscn")
var chumbo = preload("res://Scenes/ChumboGrosso.tscn")
var mov = Vector2.ZERO

func _process(delta: float) -> void:
	mov = global_position.direction_to(Global.jogador.global_position)

	if Global.arma == 2:
		if Input.is_action_pressed("atirar") and Global.recarregado == true and Global.couldown == false:
			var instancia_chumbo = Global.instance_node(chumbo, global_position, Global.criacao_no_pai)
			instancia_chumbo.rotation = mov.angle() - 120
