extends AnimatedSprite


onready var indicator = $"%MoodIndicator"

func set_mood(value):
	var indicator_pos = -600 + value * 134
	indicator.position.x = indicator_pos
