extends AnimatedSprite

onready var ray_cast = $RayCast
onready var splush = $Splush

func sauce(sauce_indicator: int):
	var out = {"points_gained": 0, "added_mood": 0}
	set_animation("sauce")
	if ray_cast.is_colliding():
		var dish = ray_cast.get_collider()
		var position = ray_cast.get_collision_point()
		splush(position, sauce_indicator)
		
		if dish.get_collision_layer() == 1:
			out = dish.add_sauce(sauce_indicator)
		else:
			out.added_mood = -1
	else:
		out.added_mood = -1
	
	return out
		
	

func splush(position, color_indicator):
	splush.global_position = position
	splush.visible = true
	splush.set_frame(0)
	match(color_indicator):
		0:
			splush.play("splush_a")
		1:
			splush.play("splush_s")
		2:
			splush.play("splush_d")

func _on_Saucer_animation_finished():
	set_animation("idle")


func _on_Splush_animation_finished():
	splush.visible = false
