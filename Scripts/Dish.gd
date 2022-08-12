extends Area2D

func _process(delta):
	position.x += 100*delta
	print(position)
