extends Node2D

onready var saucer = $"%Saucer"
onready var production_line = $"%ProductionLine"

export var sauce_color_a: Color = Color.white
export var sauce_color_s: Color = Color.white
export var sauce_color_d: Color = Color.white

func _process(delta):
	if Input.is_action_just_pressed("sauce_a"):
		saucer.sauce(sauce_color_a)
	if Input.is_action_just_pressed("sauce_s"):
		saucer.sauce(sauce_color_s)
	if Input.is_action_just_pressed("sauce_d"):
		saucer.sauce(sauce_color_d)
	
