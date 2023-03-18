extends KinematicBody2D

var velocidade = 10
var mov = Vector2.ZERO
var a 
var b
var c
var d
var delay = false
var hp = 4

var projetil = preload("res://Scenes//Tiro.tscn")

var couldown = false


func _enter_tree() -> void:
	Global.jogador = null
	

func _ready() -> void:
	Global.jogador = self
	a = mov.x + 30
	b = mov.x - 30
	c = mov.y + 30
	d = mov.y - 30

func _process(delta: float) -> void:
	if Input.is_action_pressed("direita"):
		mov.x += 2
		if mov.x >= a:
			mov.x = 20

	elif Input.is_action_pressed("esquerda"):
		mov.x -= 2
		if mov.x <= b:
			mov.x = -20

	elif Input.is_action_pressed("baixo"):
		mov.y += 2
		if mov.y >= c:
			mov.y = 20

	elif Input.is_action_pressed("cima"):
		mov.y -= 2
		if mov.y <= d:
			mov.y = -20


	global_position += velocidade * mov * delta

	if $".".position.x > 1300 or $".".position.x < -30 or $".".position.y < -30 or $".".position.y > 670:
		$".".position.x = 517
		$".".position.y = 244
		print("There is no escape")


func _on_hitboxP_area_entered(area: Area2D) -> void:
	if area.is_in_group("barreira"):
		if mov.x > 0:
			mov.x = 10
		else:
			mov.x = -10
		if mov.y > 0:
			mov.y = 10
		else:
			mov.y = -10
		mov.x = mov.x * -1
		mov.y = mov.y * -1
	if area.is_in_group("inimigo"):
		if mov.x > 0:
			mov.x = 17
		else:
			mov.x = -17
		if mov.y > 0:
			mov.y = 17
		else:
			mov.y = -17
		mov.x = mov.x * -1
		mov.y = mov.y * -1
		hp -= 1
		if hp <= 0:
			Global.recarregado = false
			visible = false
			yield(get_tree().create_timer(1), "timeout")
			get_tree().reload_current_scene()
	
	
	pass # Replace with function body.
