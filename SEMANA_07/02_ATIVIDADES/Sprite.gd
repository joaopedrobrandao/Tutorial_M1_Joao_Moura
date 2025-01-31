extends Sprite
var count = 0

var velocidade = 180

var mov = Vector2.ZERO

var rec = -mov

var atordoado = false

var recuo = 9

var vida = 200

var particula_sangue = preload("res://Scenes/particula_sangue.tscn")

func _process(delta: float) -> void:
	if Global.jogador != null and atordoado == false:
		mov = global_position.direction_to(Global.jogador.global_position)
	
	global_position += mov * velocidade * delta
	

	if vida <= 0 and Global.criacao_no_pai != null:
		
		var instancia_particual_sangue = Global.instance_node(particula_sangue, global_position, Global.criacao_no_pai)
		instancia_particual_sangue.rotation = mov.angle()
		Global.pontuacao += 1000  * Global.pontos
		queue_free()

	if  vida <= 100:
		modulate = Color("d90000")
		velocidade = 220


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("dano"):
		area.get_parent().queue_free()
		vida -= 2

	if area.is_in_group("danudo"):
		modulate = Color.chartreuse
		modulate = Color("177c00")
		vida -= 6

	if area.is_in_group("chumbinho"):
		modulate = Color.chartreuse
		modulate = Color("177c00")
		area.get_parent().queue_free()
		vida -= 1.5

	if area.is_in_group("knock"):
		mov = -mov * recuo
		atordoado = true
		$recuo.start()
		vida -= 2

	if area.is_in_group("hitkill"):
		vida -= 4

func _on_recuo_timeout():
	atordoado = false
