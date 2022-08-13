extends AnimatedSprite



onready var sauce_preview_a = $"Sauce_Preview_A"
onready var sauce_preview_s = $"Sauce_Preview_S"
onready var sauce_preview_d = $"Sauce_Preview_D" 

func sauce(type):
	match(type):
		"a":
			sauce_preview_a.set_animation("sauce")
			sauce_preview_a.set_alpha_max()
		"s":
			sauce_preview_s.set_animation("sauce")
			sauce_preview_s.set_alpha_max()
		"d":
			sauce_preview_d.set_animation("sauce")
			sauce_preview_d.set_alpha_max()
