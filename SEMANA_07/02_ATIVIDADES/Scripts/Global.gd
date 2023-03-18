extends Node
var criacao_no_pai = null
var municao = 0
var recarregado = true
var reset = false
var jogador = null
var pontuacao = 0

func instance_node(node, location, parent):
	var node_instance = node.instance()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance
