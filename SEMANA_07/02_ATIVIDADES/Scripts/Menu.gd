extends Control
var inimigo_1 = preload("res://Scenes/Inimigo.tscn")
var inimigo_2 = preload("res://Scenes/Inimigo_2.tscn")
var boss = preload("res://Scenes/Boss.tscn")
var shell = load("res://imagens/shell.png")
var Eshell = load("res://imagens/shell-empty.png")
var Bala = load("res://imagens/BALA (4).png")
var municao = load("res://imagens/municao.png")
var click = 0
var repeat = true
var acabou = false
var chefao = true

func _ready() -> void:
	for child in self.get_children():
		if "mouse_filter" in child:
			child.mouse_filter = MOUSE_FILTER_IGNORE
	
	Global.hp = 4
	
	$Synthwave.play()
	Global.recarregado = true
	Global.criacao_no_pai = self
	Global.municao = 0
	if Global.arma == 0:
		get_node("Sprite0").texture = shell
		get_node("Sprite1").texture = shell
		get_node("Sprite2").texture = shell
		get_node("Sprite3").texture = shell
		get_node("Sprite4").texture = shell
		get_node("Sprite5").texture = shell
		get_node("Sprite6").texture = shell
		get_node("Sprite7").texture = shell

	if Global.arma == 1:
		get_node("Sprite0").texture = Bala
		get_node("Sprite1").texture = Bala
		get_node("Sprite2").texture = Bala
		get_node("Sprite3").texture = Bala
		get_node("Sprite4").texture = Bala
		get_node("Sprite5").texture = Bala

	if Global.arma == 2:
		get_node("Sprite0").texture = municao
		$Sprite0.scale = Vector2(0.2, 0.2)
		$Label2.text = str(30 - Global.municao)

func _exit_tree() -> void:
	Global.criacao_no_pai = null

func _process(delta):
	$Label.text = str(Global.pontuacao)
	
	if Global.pontuacao >= 5000:
		get_tree().change_scene("res://Scenes/End.tscn")
	
	
	if Global.pontuacao >= 4500:
		acabou = true

	if Global.arma == 0:
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

		if Global.municao == 8 and repeat:
			repeat = false
			$AudioStreamPlayer2D.play()
			recarregamento()

	if Global.arma == 1:
		if Global.municao == 1:
			get_node("Sprite5").texture = Eshell
		elif Global.municao == 2:
			get_node("Sprite4").texture = Eshell
		elif Global.municao == 3:
			get_node("Sprite3").texture = Eshell
		elif Global.municao == 4:
			get_node("Sprite2").texture = Eshell
		elif Global.municao == 5:
			get_node("Sprite1").texture = Eshell
		elif Global.municao == 6:
			get_node("Sprite0").texture = Eshell

		if Global.municao == 6 and repeat:
			repeat = false
			$AudioStreamPlayer2D.play()
			recarregamento()

	if Global.arma == 2:
		$Label2.text = str(30 - Global.municao)
		if Global.municao == 30 and repeat:
			repeat = false
			$AudioStreamPlayer2D.play()
			recarregamento()

	if Global.hp == 3:
		get_node("coracao4").texture = null
	elif Global.hp == 2:
		get_node("coracao3").texture = null
	elif Global.hp == 1:
		get_node("coracao2").texture = null
	elif Global.hp == 0:
		get_node("coracao").texture = null

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



func _on_Area2D_area_entered(area):
	if area.is_in_group("barreira"):
		pass



func _on_EnemySpawn_timeout() -> void:
	var posicao_inimigo = Vector2(rand_range(-160,1250),rand_range(-90,690))
	if !acabou:
		while posicao_inimigo.x < 1200 and posicao_inimigo.x > -80 and posicao_inimigo.y < 620 and posicao_inimigo.y > -45:
			posicao_inimigo = Vector2(rand_range(-160,1250),rand_range(-90,690))
		
		Global.instance_node(inimigo_1, posicao_inimigo, self)
	else:
		
		if chefao:
			chefao = false
			while posicao_inimigo.x < 1200 and posicao_inimigo.x > -80 and posicao_inimigo.y < 620 and posicao_inimigo.y > -45:
				posicao_inimigo = Vector2(rand_range(-160,1250),rand_range(-90,690))
				
			Global.instance_node(boss, posicao_inimigo, self)

func recarregamento():
	$AudioStreamPlayer2D/recarregarkrl.start()



func _on_recarregarkrl_timeout():
	Global.municao = 0
	Global.recarregado = true
	if Global.arma == 0:
		get_node("Sprite0").texture = shell
		get_node("Sprite1").texture = shell
		get_node("Sprite2").texture = shell
		get_node("Sprite3").texture = shell
		get_node("Sprite4").texture = shell
		get_node("Sprite5").texture = shell
		get_node("Sprite6").texture = shell
		get_node("Sprite7").texture = shell
	if Global.arma == 1:
		get_node("Sprite0").texture = Bala
		get_node("Sprite1").texture = Bala
		get_node("Sprite2").texture = Bala
		get_node("Sprite3").texture = Bala
		get_node("Sprite4").texture = Bala
		get_node("Sprite5").texture = Bala
	if Global.arma == 2:
		get_node("Sprite0").texture = municao
	repeat = true



func _on_Enemy2_timeout():
	var posicao_inimigo = Vector2(rand_range(-160,1250),rand_range(-90,690))
	if !acabou:
		while posicao_inimigo.x < 1200 and posicao_inimigo.x > -80 and posicao_inimigo.y < 620 and posicao_inimigo.y > -45:
			posicao_inimigo = Vector2(rand_range(-160,1250),rand_range(-90,690))
		
		Global.instance_node(inimigo_2, posicao_inimigo, self)
