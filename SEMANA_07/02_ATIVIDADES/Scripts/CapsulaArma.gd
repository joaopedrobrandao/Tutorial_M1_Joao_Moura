extends Sprite

var capsula = preload("res://Scenes/Capsula.tscn")
var projetil = preload("res://Scenes/ProjetilMagnum.tscn")
var chumbo = preload("res://Scenes/ChumboGrosso.tscn")
var mov = Vector2.ZERO

func _process(delta: float) -> void:
	mov = global_position.direction_to(Global.jogador.global_position)
	if Global.arma == 0:
		if Input.is_action_just_pressed("atirar") and Global.recarregado == true and Global.couldown == false:
			var instancia_capsula = Global.instance_node(capsula, global_position, Global.criacao_no_pai)
			instancia_capsula.rotation = mov.angle() - 49

	if Global.arma == 1:
		if Input.is_action_just_pressed("atirar") and Global.recarregado == true and Global.couldown == false:
			var instancia_projetil = Global.instance_node(projetil, global_position, Global.criacao_no_pai)
			instancia_projetil.rotation = mov.angle() - 120


