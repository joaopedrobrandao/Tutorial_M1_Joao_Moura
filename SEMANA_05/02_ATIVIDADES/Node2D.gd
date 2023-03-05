extends Node2D

var teste = false
var valor = 0
var numero = 0 #presença do acento "´" na variavel numero
var lista = [] #falta do uso do var

#var não declaradas anteriormente:
var cont
var i
var nome
var y

func _on_Button_pressed():
	#Coletando dados inseridos pelo usuário
	numero = int($LineEdit.text)
	nome = $LineEdit2.text
	$LineEdit.text = ""
	$LineEdit2.text = ""
	#ordem errada no recebimento de valor

func _on_Button2_pressed():
	#Incrementando o número inserido pelo usuário
	lista = []
	for i in range(10):
		numero+=i
		lista.append(numero)
	i = 0

func _on_Button3_pressed():
	#Mudando o nome do usuário de acordo com os dados da lista
	#Se houver algum número ímpar o nome deve adicionar "baldo" ao final
	#Substituição do while por um for
	#trocar a variavel i por outro, pois já estava sendo utilizada
		cont=0
		y=0
		for y in range(lista.size()):
			if(lista[y]%2==1):
				cont+=1
		if(cont!=0):
			nome += " baldo"
		$RichTextLabel2.text = str(nome)
		$RichTextLabel.text = str(numero)
