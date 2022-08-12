extends Area2D


export var speed = 100

func _process(delta):
	
	if Input.is_action_pressed("sauce_a"):
		$Sauce.set_visible(true)
	
	position.x += speed * delta
