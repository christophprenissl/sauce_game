extends Control

onready var retry_button = $"%RetryButton"
onready var retry_sprite = $RetryButton/RetrySprite

var sprite_pos

func _ready():
	sprite_pos = retry_sprite.position

func _process(_delta):
	if retry_button.is_hovered():
		retry_sprite.modulate.a = 0.8
		retry_sprite.position.y = sprite_pos.y - 10
	else:
		retry_sprite.modulate.a = 1
		retry_sprite.position = sprite_pos

func _on_StartButton_pressed():
	get_tree().change_scene("res://Scenes/Game.tscn")
