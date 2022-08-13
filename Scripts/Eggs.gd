extends Node2D

onready var egg1 = $Egg1
onready var egg2 = $Egg2
onready var egg3 = $Egg3


func set_eggs(value):
	match(value):
		3:
			egg1.play("whole")
			egg2.play("whole")
			egg3.play("whole")
		2:
			egg1.play("whole")
			egg2.play("whole")
			egg3.play("broken")
		1:
			egg1.play("whole")
			egg2.play("broken")
			egg3.play("broken")
		0:
			egg1.play("broken")
			egg2.play("broken")
			egg3.play("broken")
