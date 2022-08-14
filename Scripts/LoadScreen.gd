extends Control

onready var button = $"%Button"
onready var sprite = $Button/Sprite

var sprite_pos

func _ready():
	sprite_pos = sprite.position

func _process(_delta):
	if button.is_hovered():
		sprite.modulate.a = 0.8
		sprite.position.y = sprite_pos.y - 10
	else:
		sprite.modulate.a = 1
		sprite.position = sprite_pos

func _on_StartButton_pressed():
	get_tree().change_scene("res://Scenes/Game.tscn")
