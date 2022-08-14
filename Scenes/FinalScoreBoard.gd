extends AnimatedSprite


onready var hundreds = $"%Hundreds"
onready var tens = $"%Tens"
onready var ones = $"%Ones"

func _ready():
	set_score(Global.player_score)

func set_score(value):
	var number_string = str(value)
	if number_string.length() > 3:
		return
	if number_string.length() == 1:
		ones.set_animation(number_string[0])
	if number_string.length() == 2:
		tens.set_animation(number_string[0])
		ones.set_animation(number_string[1])
	if number_string.length() == 3:
		hundreds.set_animation(number_string[0])
		tens.set_animation(number_string[1])
		ones.set_animation(number_string[2])
	
