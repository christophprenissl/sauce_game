extends AnimatedSprite


onready var alpha = modulate.a

func set_alpha_max():
	set_modulate(Color(modulate.r,modulate.g,modulate.b, 1))

func _on_Sauce_Preview_animation_finished():
	set_animation("idle")
	set_modulate(Color(modulate.r,modulate.g,modulate.b, alpha))
	
