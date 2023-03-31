extends Node
var criacao_no_pai = null
var municao = 0
var recarregado = true
var reset = false
var jogador = null
var pontuacao = 0
var hp = 4
var couldown
var projetil
var arma = 2
var player_pos = Vector2(0,0)
var rng = RandomNumberGenerator.new()
var angle
var angle2

func _process(delta):
	randomize()
	angle = rng.randf_range(-0.4,0.4)
	angle2 = rng.randf_range(-0.2,0.2)

func instance_node(node, location, parent):
	var node_instance = node.instance()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance
