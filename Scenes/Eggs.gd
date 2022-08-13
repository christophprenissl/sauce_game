extends Node2D

onready var egg1 = $Egg1
onready var egg2 = $Egg2
onready var egg3 = $Egg3


func set_eggs(value):
	match(value):
		3:
			egg1.visible = true
			egg2.visible = true
			egg3.visible = true
		2:
			egg1.visible = true
			egg2.visible = true
			egg3.visible = false
		1:
			egg1.visible = true
			egg2.visible = false
			egg3.visible = false
