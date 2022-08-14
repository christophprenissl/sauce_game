extends Control

onready var button = $"%Button"
onready var sprite = $Button/Sprite
onready var spriteScaleXZoom = sprite.scale.x+0.05
onready var spriteScaleYZoom = sprite.scale.y+0.05

var sprite_pos

func _ready():
	sprite_pos = sprite.position
	sprite.modulate.a = 0.8

func _process(_delta):
	if button.is_hovered():
		sprite.modulate.a = 1
		sprite.scale.x = spriteScaleXZoom
		sprite.scale.y = spriteScaleYZoom
		
	else:
		sprite.position = sprite_pos
		sprite.scale.x = spriteScaleXZoom-0.05
		sprite.scale.y = spriteScaleYZoom-0.05
		sprite.modulate.a = 0.8

func _on_StartButton_pressed():
	get_tree().change_scene("res://Scenes/Game.tscn")


