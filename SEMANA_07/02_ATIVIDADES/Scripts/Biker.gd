extends KinematicBody2D

var velocidade = 300
var mov = Vector2.ZERO
var delay = false
var couldown = false
var magnum = preload("res://imagens/Magnum_mao_V2.png")
var Ak47 = preload("res://imagens/Ak47-hotline.png")
var Spas = preload("res://imagens/mao-godot-v4 (1).png")
var pos = Vector2(0,0)
var espera = false

func _enter_tree() -> void:
	Global.jogador = null
	

func _ready() -> void:
	Global.jogador = self

func _process(delta: float) -> void:
	pos = self.position
	Global.player_pos = pos
	mov.x = int(Input.is_action_pressed("direita")) - int(Input.is_action_pressed("esquerda"))
	mov.y = int(Input.is_action_pressed("baixo")) - int(Input.is_action_pressed("cima"))

	global_position += velocidade * mov * delta

	if Input.is_action_just_pressed("dash") and espera != true:
		espera = true
		velocidade = 900
		$hitboxP/CollisionShape2D.disabled = true
		$Timer.start()
		$Timer2.start()

	if Global.character == 1:
		Global.pontos = 2

	if Global.character == 2:
		pass

	if $".".position.x > 1300:
		$".".position.x = 0
	if $".".position.x < -30:
		$".".position.x = 1300
	if $".".position.y < -30:
		$".".position.y = 660
	if $".".position.y > 670:
		$".".position.y = 0

	if Global.arma == 0:
		$Spas.texture = Spas
		$Spas.scale = Vector2(0.15, 0.15)
		$Spas.offset.x = 120
		$Spas.offset.x -= 10
		$Spas.offset.y = -180

	if Global.arma == 1:
		$Spas.texture = magnum
		$Spas.scale = Vector2(0.2, 0.2)
		$Spas.offset.x = 20
		$Spas.offset.x -= 50

	if Global.arma == 2:
		$Spas.texture = Ak47
		$Spas.scale = Vector2(0.2, 0.2)
		$Spas.offset.y = -180
		$Spas.offset.x = 160

	if Global.hp <= 0:
		Global.recarregado = false
		visible = false
		yield(get_tree().create_timer(1), "timeout")
		get_tree().reload_current_scene()

func _on_hitboxP_area_entered(area: Area2D) -> void:
	if area.is_in_group("inimigo"):
		Global.hp -= 1
		area.get_parent().queue_free()

	if area.is_in_group("boss"):
		Global.hp -= 1

	if Global.hp <= 0:
		Global.recarregado = false
		visible = false
		yield(get_tree().create_timer(1), "timeout")
		get_tree().reload_current_scene()



func _on_Timer_timeout():
	velocidade = 300
	$hitboxP/CollisionShape2D.disabled = false



func _on_Timer2_timeout():
	espera = false
