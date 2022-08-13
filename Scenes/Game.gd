extends Node2D

onready var saucer = $"%Saucer"

func _process(delta):
	var a_pressed = false
	var s_pressed = false
	var d_pressed = false
	
	if Input.is_action_pressed("sauce_a"):
		a_pressed = true
	if Input.is_action_pressed("sauce_s"):
		s_pressed = true
	if Input.is_action_pressed("sauce_d"):
		d_pressed = true
	
	if a_pressed || s_pressed || d_pressed:
		saucer.sauce()
