extends AnimatedSprite

onready var ray_cast = $RayCast

func sauce(sauce_color: Color, sauce_indicator: int):
	var out = {"points_gained": 0, "added_mood": 0}
	set_animation("sauce")
	if ray_cast.is_colliding():
		var dish = ray_cast.get_collider()
		if dish.get_collision_layer() == 1:
			out = dish.add_sauce(sauce_color, sauce_indicator)
	else:
		out.added_mood = -1
	
	return out
		
	


func _on_Saucer_animation_finished():
	set_animation("idle")


