extends AnimatedSprite

onready var ray_cast = $RayCast

func sauce():
	set_animation("sauce")
	if ray_cast.is_colliding():
		var object = ray_cast.get_collider()
		if object.get_collision_layer() == 1:
			object.add_sauce()
		
	


func _on_Saucer_animation_finished():
	set_animation("idle")


