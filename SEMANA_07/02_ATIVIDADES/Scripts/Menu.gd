extends Control
var inimigo_1 = preload("res://Scenes/Inimigo.tscn")
var shell = load("res://imagens/shell.png")
var Eshell = load("res://imagens/shell-empty.png")
var click = 0
var repeat = true

func _ready() -> void:
	for child in self.get_children():
		if "mouse_filter" in child:
			child.mouse_filter = MOUSE_FILTER_IGNORE
	
	
	$Synthwave.play()
	Global.recarregado = true
	Global.criacao_no_pai = self
	Global.municao = 0
	get_node("Sprite0").texture = shell
	get_node("Sprite1").texture = shell
	get_node("Sprite2").texture = shell
	get_node("Sprite3").texture = shell
	get_node("Sprite4").texture = shell
	get_node("Sprite5").texture = shell
	get_node("Sprite6").texture = shell
	get_node("Sprite7").texture = shell
func _exit_tree() -> void:
	Global.criacao_no_pai = null

func _process(delta):
	$Label.text = str(Global.pontuacao)
	
	if Global.pontuacao >= 5000:
		get_tree().change_scene("res://Scenes/End.tscn")
	
	
	
	
	if Global.municao == 1:
		get_node("Sprite7").texture = Eshell
	elif Global.municao == 2:
		get_node("Sprite6").texture = Eshell
	elif Global.municao == 3:
		get_node("Sprite5").texture = Eshell
	elif Global.municao == 4:
		get_node("Sprite4").texture = Eshell
	elif Global.municao == 5:
		get_node("Sprite3").texture = Eshell
	elif Global.municao == 6:
		get_node("Sprite2").texture = Eshell
	elif Global.municao == 7:
		get_node("Sprite1").texture = Eshell
	elif Global.municao == 8:
		get_node("Sprite0").texture = Eshell
	else:
		pass


	
	if Input.is_action_just_pressed("recarregar") and !Global.recarregado and Global.municao == 8 and repeat:
		repeat = false
		$AudioStreamPlayer2D.play()
		recarregamento()

func _on_Timer_timeout():
	Global.municao = 0
	Global.recarregado = true
	get_node("Sprite0").texture = shell
	get_node("Sprite1").texture = shell
	get_node("Sprite2").texture = shell
	get_node("Sprite3").texture = shell
	get_node("Sprite4").texture = shell
	get_node("Sprite5").texture = shell
	get_node("Sprite6").texture = shell
	get_node("Sprite7").texture = shell
	repeat = true
	pass # Replace with function body.


func _on_Area2D_area_entered(area):
	if area.is_in_group("barreira"):
		pass
	pass # Replace with function body.


func _on_EnemySpawn_timeout() -> void:
	var posicao_inimigo = Vector2(rand_range(-160,1250),rand_range(-90,690))

	while posicao_inimigo.x < 1200 and posicao_inimigo.x > -80 and posicao_inimigo.y < 620 and posicao_inimigo.y > -45:
		posicao_inimigo = Vector2(rand_range(-160,1250),rand_range(-90,690))
	
	Global.instance_node(inimigo_1, posicao_inimigo, self)
	pass # Replace with function body.
	
	
func recarregamento():
	$AudioStreamPlayer2D/recarregarkrl.start()



func _on_recarregarkrl_timeout():
	Global.municao = 0
	Global.recarregado = true
	get_node("Sprite0").texture = shell
	get_node("Sprite1").texture = shell
	get_node("Sprite2").texture = shell
	get_node("Sprite3").texture = shell
	get_node("Sprite4").texture = shell
	get_node("Sprite5").texture = shell
	get_node("Sprite6").texture = shell
	get_node("Sprite7").texture = shell
	repeat = true
	pass # Replace with function body.
