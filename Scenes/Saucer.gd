extends AnimatedSprite

onready var ray_cast = $RayCast

func sauce(sauce_color: Color, sauce_indicator: int) -> int:
	var points_gained = 0
	set_animation("sauce")
	if ray_cast.is_colliding():
		var object = ray_cast.get_collider()
		if object.get_collision_layer() == 1:
			points_gained += object.add_sauce(sauce_color, sauce_indicator)
	return points_gained
		
	


func _on_Saucer_animation_finished():
	set_animation("idle")


