extends Node2D

var ficha1 = ["Vinícius; ", "\nKaike; ", "\nCaio; ", "\nMelissa; ", "\nHocs; ", "\nSonoplasta."] #Ficah da lista 1
var indice = 0 #indice para impressão da lista 1
var condicao = true #condiação para entrar no loop da lista 1
var apagar = true #condição para apagar o texto anterior a lista 2

func _ready():
	
	pass

func _on_Lista1_pressed():
	
	
	apagar = true
	condicao = true
	$ColorRect/RichTextLabel.text = "" #Apaga o texto anterior
	
	while condicao: #condiciona o loop para printar os elementos da ficha 1
		if indice < 6: #printa 
			$ColorRect/RichTextLabel.text +=  ficha1[indice] 
			indice += 1
		else:
			indice = 0
			condicao = false




func _on_Lista2_pressed():
	if apagar:
		$ColorRect/RichTextLabel.text = ""
		$ColorRect/RichTextLabel.text = $CaixaDeTexto.text
		$CaixaDeTexto.text = ""
		apagar = false
	else:
		$ColorRect/RichTextLabel.text += "\n" + $CaixaDeTexto.text
		$CaixaDeTexto.text = ""
	
	
	



func _on_lista3_pressed():

	apagar = true
	$ColorRect/RichTextLabel.text = ""
	$ColorRect/RichTextLabel.text = "Bem vindo ao trabalho do Moura, se acomode no seu lugar e clique na lista desejada"
	
	
	


func _on_lista4_pressed():
	apagar = true
	$ColorRect/RichTextLabel.text = ""
	$ColorRect/RichTextLabel.text = $CaixaDeTexto.text
	$CaixaDeTexto.text = ""
	
	
	
	
	

