extends Sprite
var comparation = preload("res://Scenes/Muni.tscn")

var count = 0

var velocidade = 100

var mov = Vector2.ZERO

var rec = -mov

var atordoado = false

var recuo = 9

var vida = 10

var particula_sangue = preload("res://Scenes/particula_sangue.tscn")

func _process(delta: float) -> void:
	if Global.jogador != null and atordoado == false:
		mov = global_position.direction_to(Global.jogador.global_position)
	
	global_position += mov * velocidade * delta
	

	if vida <= 0 and Global.criacao_no_pai != null:
		if str(Global.projetil) == str(comparation):
			var instancia_particual_sangue = Global.instance_node(particula_sangue, global_position, Global.criacao_no_pai)
			instancia_particual_sangue.rotation = mov.angle() + 160
			Global.pontuacao += 200
			queue_free()
		else:
			var instancia_particual_sangue = Global.instance_node(particula_sangue, global_position, Global.criacao_no_pai)
			instancia_particual_sangue.rotation = mov.angle()
			Global.pontuacao += 200
			queue_free()


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("dano"):
		modulate = Color.chartreuse
		area.get_parent().queue_free()
		modulate = Color("177c00")
		vida -= 1.5

	if area.is_in_group("danudo"):
		modulate = Color.chartreuse
		modulate = Color("177c00")
		vida -= 4

	if area.is_in_group("chumbinho"):
		modulate = Color.chartreuse
		modulate = Color("177c00")
		vida -= 1
		area.get_parent().queue_free()

	if area.is_in_group("knock"):
		mov = -mov * recuo
		atordoado = true
		$recuo.start()
		vida -= 2

	if area.is_in_group("hitkill"):
		vida -= 4

func _on_recuo_timeout():
	modulate = Color("105500")
	atordoado = false
	pass # Replace with function body.
